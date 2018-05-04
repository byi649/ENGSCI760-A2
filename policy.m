function policy(x, r, actions)
%This function takes an initial state of the system (x,r) and the set of
%optimal actions, and prints the optimal sequence of actions.
%
%Inputs:    x           the state of the machine (0,1,2) at beginning of hour t
%           r           the number of doughnuts left to produce
%           actions     the optimal action for each state and time period

    temp='';

    for t = 1:12 %For each time period
        index=getIndex(x,r,t); 
        x=actions(index);   %Update the mode of the machine
        r=r-1000*x;         %Update the number of doughnuts left
        temp=[temp num2str(actions(index))]; %Append the machine mode
    end

    disp(temp);
end