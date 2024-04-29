function [new_n,new_m,action]=get_select_index_action(P_action_ori,P_action_rp,P_action_r,n,m)

cur_pro = rand();
if n >=200
    action ='r';
    new_n = 241;
    new_m = 1;

elseif cur_pro < 0.4
    action = 'ori';
    new_n_mu = n + 30;
    new_n = poissrnd(new_n_mu);
    new_m_mu = m+10;
    new_m = poissrnd(new_m_mu);
else
    action = 'rp';
    new_n_mu = n+45;
    new_n = poissrnd(new_n_mu);
    new_m_mu = m - 7;
    new_m = poissrnd(new_m_mu);
end

if new_n >= 241
    new_n = 241;
end

if new_m >=35
    new_m = 35;
end

if (isnan(new_m))
    new_m = m-7;
end
end

