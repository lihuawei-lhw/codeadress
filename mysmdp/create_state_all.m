function [xn_states,ym_states] = create_state_all( M,N ,x_init,x_limit,delta,y_init,y_limit)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
xn_states = zeros(N,2);

for n = 1:N
    [xn_states(n,1),xn_states(n,2)] = initial_state_x(n,N,x_init,x_limit,delta); 
end

ym_states = zeros(M,2);

for m = 1:M
    [ym_states(m,1),ym_states(m,2)] = initial_state_y(m,M,y_init,y_limit,delta); 
end



end

