function [ c, ceq ] = min_radius_constraint( x, points)
%MIN_RADIUS_CONSTRAINT Summary of this function goes here
%   Detailed explanation goes here

c = (x(1) - points(:,1)).^2 + (x(2) - points(:,2)).^2 - x(3)^2;
ceq = [];

end

