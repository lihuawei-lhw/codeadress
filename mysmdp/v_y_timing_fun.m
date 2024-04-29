function v_y = v_y_timing_fun(y,mu_epsilon,sigma_epsilon)
v_y = -0.018*y^2 + 1.057*y - 15.534 + normrnd(mu_epsilon,sigma_epsilon);
end