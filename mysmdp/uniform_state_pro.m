function [ p_ori,p_pr,p_r ] = uniform_state_pro( p_ori,p_pr,p_r )
p_ori = p_ori/(p_ori+p_pr+p_r);
p_pr = p_pr /(p_ori+p_pr+p_r);
p_r = p_r /(p_ori+p_pr+p_r);

end

