clear
clc
% % Set the random stream to get exactly the same output
% rng(14,'twister')

%% n = 2;
% First using GlobalSearch
gs = GlobalSearch;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
sixmin = @(x)(x(1));
problem = createOptimProblem('fmincon','x0',[0.6,0.4],...
    'objective',sixmin,'lb',[0,0],'ub',[1,1],'nonlcon',@nlinconst,...
    'options',opts);
[xming,fming,flagg,outptg,manyminsg] = run(gs,problem);

% Then using MultiStart
ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
problem = createOptimProblem('fmincon','x0',[0.6,0.4],...
    'objective',sixmin,'lb',[0,0],'ub',[1,1],'nonlcon',@nlinconst,...
    'options',opts);
[xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);

%% n = 3;
% First using GlobalSearch
gs = GlobalSearch;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
sixmin = @(x)(x(1));
problem = createOptimProblem('fmincon','x0',[0.6,0.2,0.2],...
    'objective',sixmin,'lb',[0,0,0],'ub',[1,1,1],'nonlcon',@nlinconst1,...
    'options',opts);
[xming,fming,flagg,outptg,manyminsg] = run(gs,problem);


% First using MultiStart
ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
problem = createOptimProblem('fmincon','x0',[0.6,0.2,0.2],...
    'objective',sixmin,'lb',[0,0,0],'ub',[1,1,1],'nonlcon',@nlinconst1,...
    'options',opts);
[xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);


%% n = 100;
% First using GlobalSearch
gs = GlobalSearch;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
sixmin = @(x)(x(1));
problem = createOptimProblem('fmincon','x0',[1 zeros(1,99)],...
    'objective',sixmin,'lb',0*zeros(1,100),'ub',ones(1,100),'nonlcon',@nlinconst3,...
    'options',opts);
[xming,fming,flagg,outptg,manyminsg] = run(gs,problem);


% Second using MultiStart
ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
problem = createOptimProblem('fmincon','x0',[1 zeros(1,99)],...
    'objective',sixmin,'lb',0*zeros(1,100),'ub',ones(1,100),'nonlcon',@nlinconst3,...
    'options',opts);
[xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);



% f=[-150;-175];
% A=[7 11;10 8];
% b=[77;80];
% Aeq=[0 0;0 0];
% beq=[0;0];
% LB=[0;0];UB=[9;6];
% x=linprog(f,A,b,Aeq,beq,LB,UB)

% https://optimization.mccormick.northwestern.edu/index.php/Optimization_with_absolute_values

f=[1;0;0;0];
A=[-1 0 0 0;
    -1 0 0 1;
    -1 0 1 0;
    -1 0 -1 0;
    0 -1 0 1;
    0 -1 0 -1;];
b=[-1e-2;0;0;0;0;0];
Aeq=[0 0 1 1];
beq=[1];
LB=[];UB=[];
x=linprog(f,A,b,Aeq,beq,LB,UB)






f=[1;0;0;0;0;0];
A=[-1 0 0 0 0 0;
    -1 0 0 0 1 0;
    -1 0 0 0 0 1 ;
    -1 0 0 -1 0 0;
    -1 0 0 1 0 0;
    0 -1 0 0  -1 0;
    0 -1 0 0 1 0;
    0 0 -1 0 0 -1;
    0 0 -1 0 0 1];
b=[-1e-2;0;0;0;0;0;0;0;0];
Aeq=[0 0 0 1 1 1];
beq=[1];
LB=[];UB=[];
x=linprog(f,A,b,Aeq,beq,LB,UB)



