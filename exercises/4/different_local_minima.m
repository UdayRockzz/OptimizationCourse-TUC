clear all;

f = @(x) (x(1)^2-1)^2 + (x(2)^2-1)^2 + x(1)/2 + x(2)/4

x0 = [0.127;0.062];

K = f(x0);

options = optimoptions('fminunc', ...
    'Algorithm', 'quasi-newton', ... 
    'Display', 'iter');

[xstar,fval,exitflag,output,grad,hessian] = fminunc(f,x0,options)

x = linspace(-2,2);
y = linspace(-2,2);
z = [];
for i=1:length(x)
    for j=1:length(y)
        z(i,j) = f([x(i);y(i)]);
    end
end
surf(x,y,z);