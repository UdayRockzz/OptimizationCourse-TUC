function [total_cost] = ice_cream_objective(x)

k = sum(300*x(1:12) + 0.3*x(1:12).^2);
total_cost = k + 30*x(13:24);

end