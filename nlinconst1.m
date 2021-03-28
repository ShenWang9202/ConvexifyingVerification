function [c ceq] = nlinconst1(x)
c(1) = abs(x(2)) - x(1);
c(2) = abs(x(3)) - x(1);
ceq = abs(x(1)) + abs(x(2)) + abs(x(3)) - 1;