clear all;

f = @(x) wall_thickness(x);
% f = @(x) wall_thickness_w_gradient(x); 

x0 = [8.1650;7.0711];
% x0 = [10;10];

% f(x0)
% [K, gradK] = f(x0);
K = f(x0);

   
% options = optimoptions('fminunc', ...
%     'Algorithm', 'quasi-newton', ... 
%     'Display', 'iter', ...
%     'GradObj', 'on');

options = optimoptions('fminunc', ...
    'Algorithm', 'quasi-newton', ... 
    'Display', 'iter');

[xstar,fval,exitflag,output,grad,hessian] = fminunc(f,x0,options);

