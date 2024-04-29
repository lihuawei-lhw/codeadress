function [xn_left,xn_right] = initial_state_x(n,N,x_init,x_limit,delta)
if (n < N)
    xn_left = x_init - (n-0.5)*delta;
    xn_right = x_init - (n-1.5)*delta;
else
    xn_left = 0;
    xn_right = x_limit - 0.5*delta;
end;
end

