function V = compute_function(P_action_ori,P_action_rp,P_action_r,Ci,Cp,Cr)
%COMPUTE_FUNCTION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
V = P_action_ori*Ci + P_action_rp*Cp + P_action_r*Cr;

end

