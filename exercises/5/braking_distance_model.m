function [distance] = braking_distance_model( x, velocity )
a = x(1);
b = x(2);
distance = (a*velocity.^2 + b*velocity) * 1000; 
end