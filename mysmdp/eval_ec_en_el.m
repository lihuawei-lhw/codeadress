function [ ec,en,el,policy ] = eval_ec_en_el( action_info,action_n,action_m,V_ls )
%EVAL_EC_EN_EL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
ec = V_ls(length(V_ls),1);
[en,el,policy] = eval_en_fun(action_info,action_n,action_m);


end

