#ifndef __PARALLEL_FNS_HH__
#define __PARALLEL_FNS_HH__

#include "../../deeppoly/network.hh"
#include "gurobi_c++.h"
bool run_milp_mark_with_milp_refine_mine(Network_t* net);
bool verify_by_milp_mine(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vector, size_t counter_class_index, bool is_first,std::vector<int> activations );
bool run_milp_refine_with_milp_mark_input_split_mine(Network_t* net);
bool is_layer_marked_mine(Network_t* net, Layer_t* start_layer);
void print_conf(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vector,size_t counter_class_index);
bool is_image_verified_softmax_concurrent(Network_t* net, GRBModel& model, std::vector<GRBVar>& var_vec, std::vector<int>& activations);



#endif