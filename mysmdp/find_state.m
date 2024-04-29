function [n,m] = find_state(cur_x,cur_y,xn_states,ym_states,N,M)
n = 1;
m = 1;
x_len= length(xn_states);
y_len = length(ym_states);

for i = 1:x_len
    if (cur_x >= xn_states(i,1) && cur_x <= xn_states(i,2))
        n = i;
    end
end

for j = 1:y_len
    if (cur_y >= ym_states(j,1) && cur_y <= ym_states(j,2))
        m = j;
    end
end


end

