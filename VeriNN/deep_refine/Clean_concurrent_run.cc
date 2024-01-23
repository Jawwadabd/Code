#include "concurrent_run.hh"
#include<pthread.h>
#include<bits/stdc++.h>
#include "./src/lib/drefine_driver.hh"
#include "./src/lib/pullback.hh"
#include "./src/lib/milp_refine.hh"
#include "./deeppoly/optimizer.hh"

pthread_mutex_t lck;
int i=0;
pthread_t thread_id[NUM_THREADS];
bool verif_result=true;
std::vector<std::vector<int>> combs;
Network_t* net1 = new Network_t();
std::vector<bool> return_models;
void relu_constr(Layer_t* layer, GRBModel& model, std::vector<GRBVar>& var_vector, size_t var_counter,std::vector<int>& activations){
    int marked_index=-1;
    for(size_t i=0; i< layer->dims; i++){
        Neuron_t* nt = layer->neurons[i];
        Neuron_t* pred_nt = layer->pred_layer->neurons[i];
        if(pred_nt->is_marked){
            marked_index++;
        }
        if(pred_nt->lb <= 0){
            GRBLinExpr grb_expr = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims];
            model.addConstr(grb_expr, GRB_EQUAL, 0);
        }
        else if(pred_nt->ub <= 0){
            GRBLinExpr grb_expr = var_vector[var_counter + i];
            model.addConstr(grb_expr, GRB_EQUAL, 0);
        }
        else if(pred_nt->is_marked){
            if(activations[marked_index]==1){
                GRBLinExpr grb_expr = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims];
                model.addConstr(grb_expr, GRB_EQUAL, 0);
                   grb_expr = var_vector[var_counter+i - layer->pred_layer->dims];
                   model.addConstr(grb_expr, GRB_GREATER_EQUAL, 0);
             }
            else{
                GRBLinExpr grb_expr = var_vector[var_counter + i];
                model.addConstr(grb_expr, GRB_EQUAL, 0);
                grb_expr = var_vector[var_counter + i - layer->pred_layer->dims];
                model.addConstr(grb_expr, GRB_LESS_EQUAL, 0); 
            }
        }
        else{
            double lb = -pred_nt->lb;
            GRBLinExpr grb_expr = -pred_nt->ub*var_vector[var_counter + i - layer->pred_layer->dims] + pred_nt->ub*lb;
            grb_expr += (nt->ub - lb)*var_vector[var_counter+i];
            model.addConstr(grb_expr, GRB_LESS_EQUAL, 0);

            GRBLinExpr grb_expr1 = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims];
            model.addConstr(grb_expr1, GRB_GREATER_EQUAL, 0);
        }
    }
}


void add_constraint(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vector,std::vector<int>& activations,int index){
    creating_vars_milp(net, model, var_vector); // populate var_vector with neuron names like x12,x23 
    std::cout<<"add_constraint"<<std::endl;
    size_t var_counter = net->input_layer->dims;// since input layer is not included in net->layer_vec
    for(auto layer : net->layer_vec){
        if(layer->is_activation){
            relu_constr(layer, model, var_vector, var_counter,activations);
        }
        else{
            create_milp_constr_FC_without_marked(layer, model, var_vector, var_counter);
        }

        var_counter += layer->dims;
    }
    for(size_t i=0; i<net->output_dim&&verif_result!=false; i++){
        std::cout<<"inside loop i= "<<i<< std::endl;
        if(i != net->actual_label){
            bool is_already_verified = false;
            for(size_t val : net->verified_out_dims){
                if(val == i){
                    is_already_verified = true;
                }
            }
            if(!is_already_verified){
                if(!verify_by_milp_mine(net, model, var_vector, i, true)){
                    net->counter_class_dim = i;
                    verif_result=false;
                    break;
                }
            }
        } 
    }
}

void model_gen(std::vector<int>& activations,int index){
    reset_backprop_vals(net1);
    GRBModel model = create_grb_env_and_model();
    std::vector<GRBVar> var_vector;
    add_constraint(net1, model, var_vector,activations,index);
}
void * multi_thread(void *p){
    while(verif_result!=false){
            pthread_mutex_lock(&lck);
            if(i>=combs.size()){
                pthread_mutex_unlock(&lck);
                break;    
            }
            int index = i++;
            pthread_mutex_unlock(&lck);
            model_gen(combs[index],index);
    }
}
void helper(int n, std::vector<int>& curr, std::vector<std::vector<int>>& result){
    if (n == 0) {
        result.push_back(curr);
        return;
    }

    curr.push_back(0);
    helper(n - 1, curr, result);
    curr.pop_back();

    curr.push_back(1);
    helper(n - 1, curr, result);
    curr.pop_back();
}

std::vector<std::vector<int>> combsgen(int n){
    std::vector<std::vector<int>> result;
    std::vector<int> curr;
    helper(n,curr,result);
    std::cout<<"comb_gen"<<std::endl;
    return result;
}

bool concurrent_exec(Network_t* net){
    int count =0;
    std::cout<<"con_exec"<<std::endl;
    net1=net;
    for(size_t i=0; i<net->layer_vec.size();i++){
        Layer_t* layer = net->layer_vec[i];
        if(layer->is_activation){
            continue;
        }
        for(size_t i=0; i< layer->dims; i++){
            Neuron_t* nt = layer->neurons[i];
            if(nt->is_marked){
                count++;
            }
        }
    }
    combs = combsgen(count);
    std::cout<<"size of combs "<<combs.size()<<std::endl;
    std::vector<bool> temp(combs.size(),1);
    return_models=temp;
    i=0;
    for(int i=0;i<NUM_THREADS;i++){
        std::cout<<"create "<<thread_id[i]<<std::endl;
        pthread_create(&thread_id[i], NULL, multi_thread, NULL);
    }
    for(int i = 0; i < NUM_THREADS; i++){
            pthread_join(thread_id[i], NULL);
    }
    return verif_result;
}
