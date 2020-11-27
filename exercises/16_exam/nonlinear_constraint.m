function [c,ceq] = nonlinear_constraint(x, initial_price)
c = [];
ceq(1) = 0.9*initial_price + 0.5*x(13)^2 - x(1);
for i=2:12
    ceq(i) = 0.9*x(i-1) + 0.5*x(i+12)^2 - x(i);
end
end