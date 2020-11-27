function [ f ] = DistancePointParabola( x )
%% x is a real number
%$ DistancePointParabola compute the distance between a given point P
%% and a point an a parabola  y = ax^2+bx+c, where x is given  

%% Point P
P = [2,4];

%% Set constants for Parabola y = a x^2 + b x + c
a = -1;
b = 2;
c = 0;

%% Calculate y-component of parabola
y = a*x^2 + b*x + c;

%% fullfilled constraint, that the points (x,y) on the parabola 
%%   lead to a reduced functional and we have to calculate the 
%%   distance between P and (x,y)
f =  (P(1)-x)^2 + (P(2)-y)^2 ;
%% Note: f = sqrt( (Px-x)^2 + (Py-y)^2 ) is equivalent but not differentiable

end

