function [c ceq] = nlinconst(x)
c(1) = abs(x(2)) - x(1);
ceq = abs(x(1)) + abs(x(2)) - 1;