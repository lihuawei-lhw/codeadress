function policy = eval_action_mn(action_n,action_m)
%EVAL_ACTION_MN 此处显示有关此函数的摘要
%   此处显示详细说明
policy = zeros(2,1);

for i = 20:40
    if (action_n(1,i) >=24 && action_n(1,i) <=29)
        policy(1,1) = action_n(1,i);
    end
end

for j = 20:50
    if (action_m(1,j) >=25 && action_m(1,j) <=31 )
        policy(2,1) = action_m(1,j);
    end
end
if policy(1,1) ==0
    policy(1,1) = poissrnd(25);
end
        
end

