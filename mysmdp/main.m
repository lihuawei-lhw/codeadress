x_init = 920 ; %x初始化920mm
y_init = 34.5 ; %y初始化 34.5mm
x_limit = 860;
y_limit = 26;


delta  = 0.25 ;% 间隔长度

N = (x_init - x_limit)/delta + 1;% N = 241;
M = (y_init - y_limit)/ delta + 1;% M =35;

possion_lambda = 0.1;

D = (M-1)*N+1;%D =8401;

%当x 处于 (0 , x_limit-0.5 delta ) 车轮必须更换
% [xn_left,xn_rigth] = initial_state_x(n,N,x_init,x_limit,delta);
% [ym_left,ym_right] = initial_state_y(m,M,y_init,y_limit,delta);

[xn_states,ym_states] = create_state_all( M,N ,x_init,x_limit,delta,y_init,y_limit);
mu_k = 5.9743;
sigma_k = 1.6747;
K = normrnd(mu_k,sigma_k);  % x 的损失比例
%当 m 在[1,M-1],且n 在[1，N-1] 时，可选择的状态：正常运行，或者m在[1,m-1]状态
%当m = M，n 在[1,N-1] 时，可选择的状态：m在[1,m-1]或者更换
%当n = N 时刻，必须更换

mu_x = -0.1737;
sigma_x = 0.4595;
mu_y = -0.1312;
sigma_y = 0.5342;


%v_x = normrnd(mu_x,sigma_x); %v_x 服从正态分布
%v_y = normrnd(mu_y,sigma_y); %v_y 目前服从正态分布  论文中 存在 时间线依赖关系   v_y_timing_fun(y,mu_epsilon,sigma_epsilon)  #mu_epsilon = -0.0801 , sigma_epsilon = 0.3154
mu_epsilon = -0.0801;
sigma_epsilon = 0.3154;


Ci = 10;
Cp = 400;
Cr = 12000;
%决策成本
%Ci 正常运行成本
%Cr 更换成本
%Cp  维修成本
%C r > Cp  远大于Ci

%%
%正常运行决策
%y 是轮缘
%x值踏面

%当1<=k<m<=M, p = 0；
% 当1<=m<=k<M，p = （cdf（y_init-(k-1.5)*delta） - cdf（ y_init(k-0.5)*delta ））
% /（cdf（y_init-(m-1)*delta）-cdf（0））

% 当1<=m<=k=M，p = (cdf（y_init-(k-1.5)*delta） -cdf（0）/（cdf（y_init(m-1)*delta）-cdf（0））)
% 当m =M,K=M;p = 1;

%当 1<=s<n<=N,p=0；
%当1<=n<=s<N， p=  (cdf（x_init-(s-0.5)*delta） - cdf(x_init-(s-0.5)*delta))/(cdf(x_init-(n-1)*delta）-cdf（0）)
% 当1<=n<s=N； p = （cdf（x_init(s-1.5)*delta） - cdf（0）)
% /（cdf（x_init-(n-1)*delta））- cdf（0））
%n =N,s=N; p = 1;

%综合公式：
% 1<=m <=k<=M,且 1<=n<=s<=N-1, P = py*px;
% 1<=m<=k<=M,且 1<=n<s=N,P = px；
% 否则 p= 0 

%%
%修理决策
%y的转移概率 k = m-a  p = 1; k!=m-a ; p = 0;
%x的转移概率
%当1<=s < n <=N  p = 0；
%当1<=n<=s<N; p =  p=  (概率值（x_init-(s-0.5)*delta） -
%概率值(x_init-(s-0.5)*delta))/((概率值(x_init-(n-1)*delta）-概率值（0）)
%1<=n<s=N;p = （概率值（x_init(s-1.5)*delta） - 概率值（0）)
% /（概率值（x_init-(n-1)*delta））- 概率值（0））
%n =N,s=N; p = 1;

%综合公式：
% 1<=k <=m<=M,且 1<=n<=s<=N, P = py*px;
%%
%更换决策
% 1<=m<=M;1<=n<=N,k=s=1,P=1 else  P = 0

xn_right = x_limit-0.5*delta;
ym_right = y_limit - 0.5*delta;

hour = 100; % 多少次决策
iter = 10;
V_old = zeros(3,1);

pro_ori_x_all = zeros(N,1);
pro_ori_y_all = zeros(M,1);
pro_rp_x_all = zeros(N,M-1);
pro_rp_y_all = zeros(M,M-1);

P_action_ori = zeros(N,M);
P_action_rp = zeros(N,M);
P_action_r = zeros(N,M);

cur_x = x_init;
cur_y = y_init;
n = 0;
m = 0;

action_info = zeros(iter,hour);
action_n = zeros(iter,hour);
action_m = zeros(iter,hour);
V_ls = zeros(iter,1);
%%
%不同参数
is_norm = 1;
is_norm = 0;
is_timing = 1;
is_timing =1 ;

chong = randi(3);
if chong == 0
    chong =1;
end
for i = 1:iter
    V = 0;
    for j = 1:hour
        v_x = normrnd(mu_x,sigma_x);
        if is_timing == 1
            v_y = v_y_timing_fun(cur_y,mu_epsilon,sigma_epsilon);
        else
            v_y = normrnd(mu_y,sigma_y);
        end
        
        cur_x = cur_x + v_x; %v_x 为负数
        cur_y = cur_y + v_y; %v_y 为负数
        
        [n,m] = find_state(cur_x,cur_y,xn_states,ym_states,N,M); % 寻找当前状态的 n和m
        
        %%
        %状态转移矩阵计算
        e_x = cur_x + mu_x;
        e_y = cur_y + mu_y;
        for s = 1:N
            if is_norm == 1
                if chong >0
                    e_x = e_x -(randi(chong)+1)*delta;
                    chong = chong -1;
                else
                    chong = 0 ;
                end
            end
            pro_ori_x = trans_state_x(s,n,N,delta,e_x,sigma_x,x_init,possion_lambda);
            pro_ori_x_all(s,1) = pro_ori_x;
        end
        for k = 1:M
            pro_ori_y = trans_state_y(k,m,M,delta,e_y,sigma_y,y_init,possion_lambda);
            pro_ori_y_all(k,1) = pro_ori_y;
        end
        
        for s = 1:N
            for a  = 1:m-1
                cur_e_x = cur_x - mu_k* a* delta;
                cur_sigma_x = a*delta*sigma_x;
                pro_rp_x = trans_state_x(s,n,N,delta,cur_e_x,cur_sigma_x,x_init,possion_lambda);
                pro_rp_x_all(s,a) = pro_rp_x;
            end
        end
        for k = 1:M
            for a = 1:m-1
                pro_rp_y = trans_state_rp_y(k,m,a);
                pro_rp_y_all(k,a) = pro_rp_y;
            end
        end
        for s = 1:N
            for k = 1:M
                pro_ori_x = pro_ori_x_all(s,1);
                pro_ori_y = pro_ori_y_all(k,1);
                P_action_ori(s,k) = state_ori_action(m,k,M,s,n,N,pro_ori_x,pro_ori_y);
                P_action_r(s,k) = state_r_action(m,M,n,N,k,s);
            end
        end
        
        for s = 1:N
            for k = 1:M
                for a = 1:m-1
                    pro_rp_x = pro_rp_x_all(s,a);
                    pro_rp_y = pro_rp_y_all(k,a);
                    P_action_rp(s,k) =P_action_rp(s,k) +  state_pr_action(pro_rp_x,pro_rp_y);
                end
            end
        end
        %归一化
        for k = 1:M
            sum_y = sum(pro_rp_y_all(k,:));
            for s = 1:N
                P_action_rp(s,k) = P_action_rp(s,k)/sum_y;
            end
        end
        %%
        %计算成本和新状态转移action
            
        v = compute_function(P_action_ori,P_action_rp,P_action_r,Ci,Cp,Cr);  
        [new_n,new_m,action] = find_next_state(v,P_action_ori,P_action_rp,P_action_r,n,m);
        
        
        action_n(i,j) = new_n;
        action_m(i,j) = new_m;
        n = new_n;
        m = new_m;
        
        if action == 'r'
            V = V + Cr;
            action_info(i,j) = 3;
        elseif strcmp(action,'rp')
            V = V + Cp;
            action_info(i,j) = 2;
        else
            V = V + Ci;
            action_info(i,j) = 1;
        end
        

        
    
    end
    %%
    %单次的平均计算整个的收益
    mean_V = V/hour;
    V_ls = get_V_all_eval_policy(mean_V,i,V_ls);
    V_ls = get_V_info(V_ls,is_timing);
    
    
    
    
end


%%
%迭代后 最优结果的计算
V_ls = uniform_eval_policy(V_ls);
[ ec,en,el,policy ] = eval_ec_en_el( action_info,action_n,action_m,V_ls );
V_ls,ec,en,el,policy

 plot_v(V_ls)




