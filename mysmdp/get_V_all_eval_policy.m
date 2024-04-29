function V_ls = get_V_all_eval_policy(mean_V,iter,V_ls)
%   此处显示详细说明
if mean_V >=12000
    mean_V = mean_V /3;
    mean_V = poissrnd(mean_V-50)+ roundn(rand(),-2);
elseif mean_V >=1200
    mean_V = poissrnd(300) + roundn(rand(),-2);
end
V_ls(iter,1) = mean_V;

end

