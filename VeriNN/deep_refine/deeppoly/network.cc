#include "network.hh"
#include "parser.hh"
#include "analysis.hh"
#include "deeppoly_configuration.hh"
#include "optimizer.hh"
// int main(int argc, char* argv[]){
//     Configuration::init_options(argc, argv);
//     if(Configuration::vm.count("help")){
//         return 0;
//     }

//     Network_t* net = new Network_t();
//     init_network(net, Configuration::net_path);
//     analyse(net, Configuration::dataset_path);
//     //execute_neural_network(net, Configuration::dataset_path);
//     //create_input_layer_expr(net);
//     //forward_analysis(net);
//     net->print_network();
//     return 0;
// }

void analyse(Network_t* net, std::string &image_path){
    size_t num_test = 1;
    size_t verified_counter = 0;
    size_t image_counter = 0;
    // std::cout<<"here in fpn"<<std::endl;
    for(size_t i=1; i <= num_test; i++){
        if( i != 3){
            //continue;
        }
        //printf("%d\n",i);
        parse_input_image(net, image_path, i);
        net->forward_propgate_network(0, net->input_layer->res);
        auto pred_label = xt::argmax(net->layer_vec.back()->res);
        std::cout<<"here in fpn"<<std::endl;
        net->pred_label = pred_label[0];
        if(net->actual_label != net->pred_label){
            std::cout<<"Predicted, actual label: ("<<net->pred_label<<","<<net->actual_label<<")"<<", network predicted wrong output"<<std::endl;
        }
        else{
            
            reset_network(net);
            //mark_layer_and_neurons(net->layer_vec[2]);
            create_input_layer_expr(net);
            forward_analysis(net);
            bool is_varified = is_image_verified(net);
            if(is_varified){
                verified_counter++;
                std::cout<<i-1<<" Image: "<<net->pred_label<<" verified!\n";
            }
            else{
                std::cout<<i-1<<" Image: "<<net->pred_label<<" not verified!\n";
            }
            image_counter++;
        }
    }

    std::cout<<"Images: "<<verified_counter<<"/"<<image_counter<<" verified"<<std::endl;
}

void Network_t::forward_propgate_one_layer(size_t layer_index, 
                                           xt::xarray<double> &inp){
    Layer_t* layer = this->layer_vec[layer_index];
    if(layer->is_activation){
        layer->res = xt::maximum(inp, 0);
    }
    else{
        xt::xarray<double> matmul = xt::linalg::dot(inp, layer->w);
        layer->res = matmul + layer->b;
    }

}

void Network_t::forward_propgate_one_layer_mine(size_t layer_index, 
                                           xt::xarray<double> &inp){
    Layer_t* layer = this->layer_vec[layer_index];
    if(layer->is_activation){
        layer->res = xt::maximum(inp, 0);
    }
    else{
        xt::xarray<double> matmul = xt::linalg::dot(inp, layer->w);
        layer->res = matmul + layer->b;
        for(size_t j=0; j< layer->dims; j++){
            Neuron_t* nt = layer->neurons[j];
            if(nt->is_marked){
                test_lb.push_back(nt->lb);
                test_ub.push_back(nt->ub);
                test_satval.push_back(nt->sat_val);
                test_exval.push_back(layer->res[j]);
            }
        }
    }



}

void Network_t::forward_propgate_network(size_t layer_index, 
                              xt::xarray<double> &inp){
    bool is_first = true;
    for(size_t i = layer_index; i < this->numlayers; i++){
        if(is_first){
            this->forward_propgate_one_layer_mine(i,inp);
            is_first = false;
        }
        else{
            this->forward_propgate_one_layer_mine(i, this->layer_vec[i-1]->res);
        }
    }
}

void Expr_t::deep_copy(Expr_t* expr){
    //this->coeff_inf.resize(expr->coeff_inf.size());
    this->coeff_inf.assign(expr->coeff_inf.begin(), expr->coeff_inf.end());
    //this->coeff_sup.resize(expr->coeff_sup.size());
    this->coeff_sup.assign(expr->coeff_sup.begin(), expr->coeff_sup.end());
    this->cst_inf = expr->cst_inf;
    this->cst_sup = expr->cst_sup;
    this->size = expr->size;
    // for(auto constr : expr->constr_vec){
    //     Constr_t* con = new Constr_t();
    //     con->deep_copy(constr);
    //     this->constr_vec.push_back(con);
    // }
}

// void Constr_t::deep_copy(Constr_t* constr){
//     this->expr->deep_copy(constr->expr);
//     this->is_positive = constr->is_positive;
// }

// void Constr_t::print_constr(){
//     this->expr->print_expr();
//     if(this->is_positive){
//         std::cout<<" > 0";
//     }
//     else{
//         std::cout<<" <= 0";
//     }
// }

void Expr_t::print_expr(){
    for(size_t i=0; i<this->coeff_sup.size(); i++){
        std::cout<<this->coeff_sup[i]<<",";
    }
    std::cout<<this->cst_sup;
}


void Neuron_t::print_neuron(){
    //printf("neuron,%ld,%g,%g\n",this->neuron_index,-this->lb,this->ub);
    std::cout<<"neuron,"<<this->neuron_index<<","<<-this->lb<<","<<this->ub<<std::endl;
    //std::cout<<"upper,";
    //this->uexpr->print_expr();
    //std::cout<<std::endl;
    //std::cout<<"lower,";
    //this->lexpr->print_expr();
    //std::cout<<std::endl;
}

void Layer_t::print_layer(){
    std::cout<<"layer,"<<this->layer_index<<","<<this->is_activation<<","<<this->dims<<std::endl;
     for(auto nt : this->neurons){
         nt->print_neuron();
     }
}

void Network_t::print_network(){
    std::cout<<"inputdim,"<<this->input_dim<<std::endl;
    for(auto layer : this->layer_vec){
            layer->print_layer();
    }
}

void reset_network(Network_t* net){
    for(auto layer: net->layer_vec){
        reset_layer(layer);
    }
}
void reset_layer(Layer_t* layer){
    for(size_t i=0; i < layer->neurons.size(); i++){
        Neuron_t* nt = layer->neurons[i];
        //std::cout<<"Layer: "<<layer->layer_index<<" , neuron: "<<nt->neuron_index<<std::endl;
        nt->~Neuron_t();
        nt->lb = INFINITY;
        nt->ub = INFINITY;
        nt->is_back_prop_active = false;
    }
}

void mark_layer_and_neurons(Layer_t* layer){
    if(Configuration_deeppoly::is_small_ex){
        if(layer->layer_index == 2){
            layer->is_marked = true;
            layer->neurons[0]->is_marked = true;
            layer->neurons[0]->is_active = true;
        }
    }
}

double round_off(double num, size_t prec){
    if(num == 0){
        return num;
    }
    double mult = pow(10.0f, float(prec));
    double val = mult*num + 0.5;
    double res = round(val) / mult;
    return res;
}

