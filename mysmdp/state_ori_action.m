function P = state_ori_action(m,k,M,s,n,N,px,py)
if (M >=k && k >=m && N-1 >= s && s>=n)
    P = px*py;
elseif (M>=k &&k >=m && s == N && s > n)
    P = px;
else
    P = 0;
end
end