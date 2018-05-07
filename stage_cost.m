function cost = stage_cost(x, a, t, U, D, p)
%This function takes in the state of the machine at the beginning of hour t
%and the action that is taken in hour t and returns the stage-cost.
%
%Inputs:    x       the state of the machine (0,1,2) at beginning of hour t
%           a       the action we choose at start of hour t
%           t       the period (hour)
%           U       the start-up cost
%           D       the shut-down cost
%           p       the vector of prices over the 12 periods
    
    if(x==0)
        if(a==0)
            cost=0;
        else
            cost=U + floor(2.5*a)*p(t);
        end
    else
        if(a==0)
            cost=D;
        else
            cost=floor(2.5*a)*p(t);
        end
    end 
end

