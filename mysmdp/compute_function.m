function V = compute_function(P_action_ori,P_action_rp,P_action_r,Ci,Cp,Cr)
%COMPUTE_FUNCTION 此处显示有关此函数的摘要
%   此处显示详细说明
V = P_action_ori*Ci + P_action_rp*Cp + P_action_r*Cr;

end

