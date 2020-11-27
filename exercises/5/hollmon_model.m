function [sigma] = hollmon_model(x, epsilon)
K = x(1);
n = x(2);

sigma = K * epsilon.^n;

end