function [return_val] = wall_thickness(x)

c0 = 20000;
c1 = 300;
c2 = 400;

return_val = c0*(1/x(1)+1/x(2)) + c1*x(1) + c2*x(2);