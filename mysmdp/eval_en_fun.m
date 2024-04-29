function [en,el,policy] = eval_en_fun(action_info,action_n,action_m)

en = sum(action_info(1,:))/100;
el = sum(action_n(1,:))/100;

policy = eval_action_mn(action_n,action_m);

end

