function [ f ] = ode_rhs(t,y,m,r,k)
%% function that models the right hand side of the 
%% ordinary differential equation

y1 = y(1); % displacement (deflection)
y2 = y(2); % speed (time derivative of deflection)

% rhs of ordinary differential equation
f = [ y2; -k/m*y1 - r/m*y2];

end
