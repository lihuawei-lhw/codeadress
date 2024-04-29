function action = find_action(cur_P_action_ori,cur_P_action_rp,cur_P_action_r)

if cur_P_action_r == 1
    action = 'r';
else
   rand_pro = rand();
   PP = cumsum([cur_P_action_ori,cur_P_action_rp]);
   if rand_pro < PP(1)
       action = 'ori';
   elseif rand_pro < PP(2)
       action = 'rp';
   
   end
end

