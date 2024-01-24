#include "milp_refine.hh"
#include "pullback.hh"
#include "../../deeppoly/analysis.hh"
#include "../../deeppoly/optimizer.hh"

double get_umax_i(Layer_t* layer, size_t i){
    double max_val = -INFINITY;
    for(size_t j=0; j<layer->dims; j++){
        Neuron_t* nt = layer->neurons[j];
        if(j != i){
            if(nt->ub > max_val){
                max_val = nt->ub;
            }
        }
    }
    return max_val;
}

bool is_image_verified_softmax(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vec){
    Layer_t* out_layer = net->layer_vec.back();
    double l_max_var = -INFINITY;
    double u_max_var = -INFINITY;
    for(size_t i=0; i<net->output_dim; i++){
        if(net->actual_label != i){
            Neuron_t* nt = out_layer->neurons[i];
            double lb = -nt->lb;
            if(l_max_var < lb){
                l_max_var = lb;
            }

            if(u_max_var < nt->ub){
                u_max_var = nt->ub;
            }
        }
    }
    std::vector<GRBVar> bin_var_vec;
    std::string max_var_str = "softmax_max_var_"+std::to_string(out_layer->layer_index);
    GRBVar max_var = model.addVar(l_max_var, u_max_var, 0.0, GRB_CONTINUOUS,max_var_str);
    size_t correct_var_idx = get_gurobi_var_index(out_layer, net->actual_label);
    model.addConstr(max_var - var_vec[correct_var_idx] - Configuration_deeppoly::softmax_conf_value, GRB_GREATER_EQUAL, 0);
    // for(size_t i=0; i<net->output_dim; i++){
    //     Neuron_t* nt = net->layer_vec.back()->neurons[i];
    //     std::cout<<"("<<-nt->lb<<","<<nt->ub<<")"<<std::endl;
    // }

    for(size_t i=0; i<net->output_dim; i++){
        if(i != net->actual_label){
            Neuron_t* nt = out_layer->neurons[i];
            if(nt->ub > l_max_var){
                double lb = -nt->lb;
                size_t var_idx = get_gurobi_var_index(out_layer, i);
                std::string var_str = "softmax_bin_"+std::to_string(out_layer->layer_index)+"_"+std::to_string(i);
                GRBVar bin_var = model.addVar(0,1,0,GRB_BINARY, var_str);
                bin_var_vec.push_back(bin_var);
                double umax_i = get_umax_i(out_layer, i);
                GRBLinExpr grb_expr1 = max_var - var_vec[var_idx] - (1-bin_var)*(umax_i - lb);
                model.addConstr(grb_expr1, GRB_LESS_EQUAL, 0);
                GRBLinExpr grb_expr2 = max_var - var_vec[var_idx] - (1-bin_var)*Configuration_deeppoly::softmax_conf_value;
                model.addConstr(grb_expr2, GRB_GREATER_EQUAL, 0);
            }
        }
    }

    // size_t idx = get_gurobi_var_index(out_layer, 0);

    // for(size_t i=0; i<net->output_dim; i++){
    //     if(i != 6){
    //         model.addConstr(var_vec[idx+6]-var_vec[idx+i]-Configuration_deeppoly::softmax_conf_value, GRB_GREATER_EQUAL, 0);
    //     }
    // }

    std::cout<<"Number of binary variables: "<<bin_var_vec.size()<<std::endl;
    GRBLinExpr sum_expr = 0;
    for(GRBVar var : bin_var_vec){
        sum_expr += var;
    }
    model.addConstr(sum_expr, GRB_EQUAL, 1);

    std::cout<<"Optimizing in softmax constraint...."<<std::endl;
    // std::string model_file_path = "/home/u1411251/jawwad/code/VeriNN/deep_refine";
    // model_file_path += "/model.lp";
    // model.write(model_file_path);
    model.optimize();
    int status = model.get(GRB_IntAttr_Status);
    std::cout<<"Optimization status: "<<status<<std::endl;
    if(status == GRB_OPTIMAL){
        // std::cout<<"Max value: "<<max_var.get(GRB_DoubleAttr_X)<<std::endl;
        update_sat_vals(net, var_vec);
        return false;
    }

    return true;
}

bool is_image_verified_softmax_deeppoly(Network_t* net){
    Layer_t* out_layer = net->layer_vec.back();
    double correct_lb = -out_layer->neurons[net->actual_label]->lb;
    for(size_t i=0; i<net->output_dim; i++){
        if(net->actual_label != i){
            Neuron_t* nt = out_layer->neurons[i];
            if(correct_lb > (nt->ub - Configuration_deeppoly::softmax_conf_value)){
                //verified
            }
            else{
                return false;
            }
        }
    }

    return true;
}

bool is_image_verified_by_milp(Network_t* net){
    reset_backprop_vals(net);
    GRBModel model = create_grb_env_and_model();
    std::vector<GRBVar> var_vector;
    create_milp_mark_milp_refine_constr(net, model, var_vector);
    if(Configuration_deeppoly::is_softmax_conf_ce){
        return is_image_verified_softmax(net, model, var_vector); 
    }
    for(size_t i=0; i<net->output_dim; i++){
        if(i != net->actual_label){
            bool is_already_verified = false;
            for(size_t val : net->verified_out_dims){
                if(val == i){
                    is_already_verified = true;
                }
            }
            if(!is_already_verified){
                if(!verify_by_milp(net, model, var_vector, i, true)){
                    net->counter_class_dim = i;
                    return false;
                }
                else{
                    net->verified_out_dims.push_back(i);
                }
            }
        }
    }

    return true;
}

void create_milp_mark_milp_refine_constr(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vector){
    creating_vars_milp(net, model, var_vector);
    size_t var_counter = net->input_layer->dims;
    for(auto layer : net->layer_vec){
        if(layer->is_activation){
            create_relu_constr_milp_refine(layer, model, var_vector, var_counter);
        }
        else{
            create_milp_constr_FC_without_marked(layer, model, var_vector, var_counter);
        }
        var_counter += layer->dims;
    }
}

void creating_vars_milp(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vector){
    create_vars_layer(net->input_layer, model, var_vector);
    for(auto layer : net->layer_vec){
        create_vars_layer(layer, model, var_vector);
    }
}

void create_vars_layer(Layer_t* layer, GRBModel& model, std::vector<GRBVar>& var_vector){
    for(auto nt: layer->neurons){
        std::string var_str = "x,"+std::to_string(layer->layer_index)+","+std::to_string(nt->neuron_index);
        GRBVar x = model.addVar(-nt->lb, nt->ub, 0.0, GRB_CONTINUOUS, var_str);
        var_vector.push_back(x);
    }
}

void create_relu_constr_milp_refine(Layer_t* layer, GRBModel& model, std::vector<GRBVar>& var_vector, size_t var_counter){
    assert(layer->is_activation && "Not activation layer\n");
    for(size_t i=0; i< layer->dims; i++){
        Neuron_t* nt = layer->neurons[i];
        Neuron_t* pred_nt = layer->pred_layer->neurons[i];
        if(pred_nt->lb <= 0){
            GRBLinExpr grb_expr = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims];
            //printf("\nhere\nn");
            //printf("%d",var_vector[var_counter+i]);
            model.addConstr(grb_expr, GRB_EQUAL, 0);
        }
        else if(pred_nt->ub <= 0){
            GRBLinExpr grb_expr = var_vector[var_counter + i];
            model.addConstr(grb_expr, GRB_EQUAL, 0);
        }
        else if(pred_nt->is_marked){
            // printf("\nhere\n");
            double lb = -pred_nt->lb;
            std::string var_str = "bin,"+std::to_string(layer->layer_index)+","+std::to_string(nt->neuron_index);
            GRBVar bin_var = model.addVar(0,1,0,GRB_BINARY, var_str);
            
            GRBLinExpr grb_expr = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims] - lb*bin_var;
            model.addConstr(grb_expr, GRB_LESS_EQUAL, -lb);

            grb_expr = var_vector[var_counter+i] - var_vector[var_counter + i - layer->pred_layer->dims];
            model.addConstr(grb_expr, GRB_GREATER_EQUAL, 0);

            grb_expr = var_vector[var_counter+i] - pred_nt->ub*bin_var;
            model.addConstr(grb_expr, GRB_LESS_EQUAL, 0);

            grb_expr = var_vector[var_counter+i];
            model.addConstr(grb_expr, GRB_GREATER_EQUAL, 0);

            // model.addGenConstrIndicator(bin_var, true, var_vector[var_counter + i - layer->pred_layer->dims], GRB_GREATER_EQUAL, 0.0);
            // model.addGenConstrIndicator(bin_var, false, var_vector[var_counter + i - layer->pred_layer->dims], GRB_LESS_EQUAL, 0.0);
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

void create_milp_constr_FC_without_marked(Layer_t* layer, GRBModel& model, std::vector<GRBVar>& var_vector, size_t var_counter){    
    assert(layer->layer_type == "FC" && "Layer type is not FC");
    size_t start_index = var_counter - layer->pred_layer->dims;
    size_t end_index = var_counter;
    std::vector<GRBVar> new_vec;
    new_vec.reserve(layer->pred_layer->dims);
    copy_vector_by_index(var_vector, new_vec, start_index, end_index);
    for(size_t i=0; i<layer->dims; i++){
        Neuron_t* nt = layer->neurons[i];
        GRBLinExpr grb_expr;// = -1*var_vector[end_index+i];
        grb_expr.addTerms(&nt->uexpr->coeff_sup[0], &new_vec[0], new_vec.size());
        grb_expr += nt->uexpr->cst_sup;
        grb_expr += -1*var_vector[var_counter+nt->neuron_index];
        model.addConstr(grb_expr, GRB_EQUAL, 0);
    }
}

bool is_prp_verified_by_milp(Network_t* net){
    reset_backprop_vals(net);
    GRBModel model = create_grb_env_and_model();
    std::vector<GRBVar> var_vector;
    create_milp_mark_milp_refine_constr(net, model, var_vector);
    bool is_sat = is_sat_prop_main_pure_milp(net, model, var_vector);
    return !is_sat;
}

