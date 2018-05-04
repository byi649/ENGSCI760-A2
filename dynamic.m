%This script runs the dynamic programming recursion and determines the
%optimal actions to take in each period.
%
% V is a vector of the total cost of stages t,t+1,...,12, if you are in
% state (x,r) in stage t. (Use the getIndex function to modify it.)

% actions is a vector of the optimal actions, given the state (x,r) and the
% stage t.

% M is a big-M used to set the value of infeasible states in the final
% stage, and also to initialize unexplored states.

% U is the start-up cost, D is the shut-down cost, and p is a vector of
% electricity prices.

clear all;
M=10000;

U=10;
D=10;
p=[40;42;38;29;25;26;38;16;24;32;36;48];

V=M*ones(3*11*13,1);

V(getIndex(,,13))=; %Complete this line, which sets the value function in hour 13 (N+1)
V(getIndex(,,13))=; %Complete this line, which sets the value function in hour 13 (N+1)

actions=zeros(3*11*13,1);

for t = 12:-1:1
    for x=0:2
        for r=0:1000:10000
            index=getIndex(x,r,t);
            for a= %Complete this line, which loops over feasible actions (the min function will be useful)
                next_index=getIndex(,,t+1); %Complete this line, which finds to index of the value function the next period,
                                           %given you're in state (x,r) at the beginning of period t and you take action a.

                temp=stage_cost(x,a,t,U,D,p) + V(next_index); %finds the stage cost + future cost of action a
                
                if temp<V(index) %if this action is cheaper than other actions, so far
                    V(index)=temp; %set the value of this action to be the value of being in this state/stage
                    actions(index)=a; %set the current action to be the best action
                end
            end
        end
    end
end