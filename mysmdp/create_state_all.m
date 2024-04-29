function [xn_states,ym_states] = create_state_all( M,N ,x_init,x_limit,delta,y_init,y_limit)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
xn_states = zeros(N,2);

for n = 1:N
    [xn_states(n,1),xn_states(n,2)] = initial_state_x(n,N,x_init,x_limit,delta); 
end

ym_states = zeros(M,2);

for m = 1:M
    [ym_states(m,1),ym_states(m,2)] = initial_state_y(m,M,y_init,y_limit,delta); 
end



end

