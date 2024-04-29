
function [ym_left,ym_right] = initial_state_y(m,M,y_init,y_limit,delta)
if (m < M)
    ym_left = y_init - (m-0.5)*delta;
    ym_right = y_init - (m-1.5)*delta;
else
    ym_left = 0;
    ym_right = y_limit - 0.5*delta;
end;
end
