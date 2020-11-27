clear all
close all

f = @(x) (1-x(1))^2 + 100*(x(2)-x(1)^2)^2;


x0 = [5;5];

options = optimoptions('fminunc', ...
    'Algorithm', 'quasi-newton', ... 
    'Display', 'iter');

[xstar,fval,exitflag,output,grad,hessian] = fminunc(f,x0,options);


x1 = -5:0.1:5;
x2 = -5:0.1:5;

[X1,X2] = meshgrid(x1,x2);

f_ = (1-X1).^2 + 100.*(X2-X1.^2).^2;

surfc(x1, x2, f_)
