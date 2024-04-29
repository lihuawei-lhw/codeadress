function pro = trans_state_y(k,m,M,delta,mu,sigma,y_init,possion_lambda)

if (M>=m && m > k)
    pro = 0;
elseif (M>m && k >= m)
    pro = (normcdf(y_init-(k-1.5)*delta,mu,sigma)-normcdf(y_init-(k-0.5)*delta))/(normcdf(y_init-(m-1)*delta));
elseif (k == M && k > m)
    pro = normcdf(y_init-(k-1.5)*delta,mu,sigma)/(normcdf(y_init-(m-1)*delta));
elseif (m==M && k == M)
    pro = 1;
end
pro = abs(pro);
end

