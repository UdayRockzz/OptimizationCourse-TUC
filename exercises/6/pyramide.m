function [ g ] = pyramide( x, v )

%% Calculates the model response g  as vector
%% Input: x (current estimate), xData (is here empty, but needed for lsqcurvefit)
%% Output: g (model response as vector)

%% Optimization Variables
%x1 = ...
%x2 = ...

%% measurements for   a,   d,   H,   s,   h
%g(1) = ...  % side length a
%g(2) = ...  % diagonal d
%g(3) = ...  % height H
%g(4) = ...  % edge lenght s
%g(5) = ...  % surface height h

g(1) = x(1); % a 
g(2) = x(1)*sqrt(2); % d
g(3) = x(2); % H
g(4) = sqrt(x(2).^2 + x(1).^2/2); % s
g(5) = sqrt(x(2).^2 + x(1).^2/4); % h

g = g';

end
