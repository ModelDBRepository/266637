function [temptime2]=sub_sampling_firings(linear_S,Nneur,Ttime,dt)
%% CREDITS
% Created by
% Vignayanandam R. Muddapu (Ph.D. scholar)
% C/o Prof. V. Srinivasa Chakravarthy
% Indian Institute of Technology Madras
% India

% Computing synchrony

%% CODE
% Nneur=1024;
% dt=0.005;Ttime=2000/dt;
Ntime=(Ttime)*dt;
temptime2=[];
test2=zeros(Nneur,Ntime);
for neur=1:Nneur
    test1=zeros(1,Ttime);
    temptime=linear_S((linear_S(:,2)==neur));
    
    % To remove values beyond No. of iteration
    if sum(temptime>Ttime)
        inde= temptime>Ttime;
        temptime(inde)=[];
    end
    
    % To remove values with decimal points
    temptime=round(temptime);
    
    test1(temptime)=ones(size(temptime));
    
    start=1;stop=1/dt;%1/dt=200 for 0.005
    for te=1:Ntime
        
        if(sum(test1(start:stop))>0)
            test2(te)=1;
        else
            test2(te)=0;
        end
        start=start+(1/dt);stop=stop+(1/dt);
%                 disp(te)
    end
    inds=find(test2==1);
    temptime2=[temptime2; inds,neur+0*inds];
%     disp(neur)
end
