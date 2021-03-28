%Compute zeta_n (test1)

%Define n
n = 2;

%epsilon
eps1 = 10^-9;

%Auxiliary constants
E = [0 0.5 0; 0.5 0 0; 0 0 0];
e = [0 0 1]';

%Set v_1
v_1 = 0.5;

%Optimization variables
v = sdpvar(n-1,1);
y = sdpvar(1);
z = sdpvar(1);

%Objective functions
obj = -y;

%Constraints for the optimization problem
%Constraint #1
sum = 0;
for i = 1:n-1
    sum = sum + abs(v(i));
end
F1 = sum + v_1 == 1;

%Constraint #2
F2 = [];
for i = 1:n-1
    F2 = [F2, abs(v(i)) <= v_1];
end

%Constraint #4
F4 = [z + v_1 <= 1, v_1*y == z];

%YALMIP settings
ops = sdpsettings('verbose',1,'solver','mosek');

%Solve the optimization problem
disp('Solving LMIs...');
tic;
sol = optimize([F1 F2 F4], obj, ops);
elapsedTime = toc;
disp('Done!');
fprintf(1, 'Computation time: %f seconds', elapsedTime); 
fprintf(1, '\nYALMIP status: %s', sol.info); 
fprintf('\n');
fprintf(1, 'zeta_n: %f ', value(y)); 