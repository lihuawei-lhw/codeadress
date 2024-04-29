function pro = trans_state_x(s,n,N,delta,mu,sigma,x_init,possion_lambda)
if (N>=n && n > s)
    pro = 0;
elseif (N>s && s >= n)
    pro = (normcdf(x_init-(s-1.5)*delta,mu,sigma)-normcdf(x_init-(s-0.5)*delta))/(normcdf(x_init-(n-1)*delta));
elseif (s == N && s > n)
    pro = normcdf(x_init-(s-1.5)*delta,mu,sigma)/(normcdf(x_init-(n-1)*delta));
elseif (n==N && s == N)
    pro = 1;
end
pro = abs(pro);
end