function V_ls = get_V_info(V_ls,is_timing)

for i = 1: length(V_ls)
    if V_ls(i,1) > 400
        V_ls(i,1) = 0.1*V_ls(i,1);
        if V_ls(i,1) < 150
            V_ls(i,1) = 2*V_ls(i,1);
        elseif V_ls(i,1) < 210
            V_ls(i,1) = V_ls(i,1)+poissrnd(46);
        end
        
    end
    if is_timing == 1
        V_ls(i,1) = V_ls(i,1) - poissrnd(20);
        if V_ls(i,1) < 200
            V_ls(i,1) = V_ls(i,1)+poissrnd(46);
        end
    else
        V_ls(i,1) = V_ls(i,1) + poissrnd(20);
        if V_ls(i,1) < 240
            V_ls(i,1) = V_ls(i,1)+poissrnd(76);
        end
        if V_ls(i,1) < 210
            V_ls(i,1) = V_ls(i,1) + poissrnd(15);
        end
    end
    
    
end

