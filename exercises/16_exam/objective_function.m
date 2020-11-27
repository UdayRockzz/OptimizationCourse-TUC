function [result] = objective_function(x, initial_price)
result = initial_price - x(12) + sum(x(13:24));
end