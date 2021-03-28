function [c ceq] = nlinconst3(x)
for i = 2:100
    c(i) = abs(x(i)) - x(1);
end
ceq = sum(abs(x)) - 1;