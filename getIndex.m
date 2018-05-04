function index = getIndex(x, r, t)
%This function takes values for the mode of machine, number of doughnuts to
%produce and the time period and converts it to an index to reference
%values in the V, and action vectors.
%
%Inputs:    x     the state of the machine (0,1,2) at beginning of hour t
%           r     the number of doughnuts left to produce
%           t     the period (hour)

%We first check that all the values are in range / feasible; if not, error
%is set to 1, and the index returned will be 0.

    error=0;

    if(t>13 || t<=0 || mod(t,1)~=0)
        error=1;
        disp('Stage is out of range');
    end

    if(r<0 || r>10000 || mod(r,1000)~=0)
        error=1;
        disp('State r is out of range or invalid');
    end

    if(x<0 || x>2 || mod(x,1)~=0)
       error=1
       disp('Stage x is out of range or invalid');
    end

    if(error)
        index=0;
    else
        index=(t-1)*11*3+(r/1000)*3+x+1; %converts the three inputs into an index
    end
end