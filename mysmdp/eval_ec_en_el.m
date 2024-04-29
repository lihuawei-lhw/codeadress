function [ ec,en,el,policy ] = eval_ec_en_el( action_info,action_n,action_m,V_ls )
%EVAL_EC_EN_EL 此处显示有关此函数的摘要
%   此处显示详细说明
ec = V_ls(length(V_ls),1);
[en,el,policy] = eval_en_fun(action_info,action_n,action_m);


end

