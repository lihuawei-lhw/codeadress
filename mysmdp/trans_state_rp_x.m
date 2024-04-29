function pro = trans_state_rp_x(s,n,N,delta,mu,sigma,x_init,a,possion_lambda)  % mu_k,sigma_k
if (N>=n && n > s)
    pro = 0;
elseif (N>s && s >= n)
    pro = (poisscdf(((n-s+0.5)*delta-mu*a*delta)/(sigma*a*delta),possion_lambda)-poisscdf(((n-s-0.5)*delta-mu*a*delta)/(sigma*a*delta),possion_lambda))/(poisscdf(-mu/sigma,possion_lambda)-poisscdf((-mu*a*delta-x_init+n*delta-delta)/(sigma*a*delta),possion_lambda));
elseif (s == N && s > n)
    pro = (poisscdf(((n-s+0.5)*delta-mu)/sigma,possion_lambda)-poisscdf((-mu-x_init+n*delta-delta)/sigma,possion_lambda))/(poisscdf(-mu/sigma,possion_lambda)-poisscdf((-mu-x_init+n*delta-delta)/sigma,possion_lambda));
elseif (n==N && s == N)
    pro = 1;
end

end