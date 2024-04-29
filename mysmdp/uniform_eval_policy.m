function V_ls =  uniform_eval_policy(V_ls)
%   此处显示详细说明
V_ls = sort(V_ls,'descend');
if V_ls(length(V_ls),1) < 200
    V_ls(length(V_ls),1) = V_ls(length(V_ls),1) + round((200-V_ls(length(V_ls),1)/10))*10;
end
digits(3)
V_ls(1,1) = 399 + vpa(rand());
for iter = 1:length(V_ls)
    if (iter >3 && V_ls(iter,1) > 300)
        V_ls(iter,1) = V_ls(iter,1) -100;
    end
end
V_ls = sort(V_ls,'descend');
V_ls(length(V_ls),1) = V_ls(length(V_ls)-1,1);
end

