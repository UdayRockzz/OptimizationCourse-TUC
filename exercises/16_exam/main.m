clear all

% x(1:12) = machine value for each month
% x(13:24) = maintenance cost for each month

initial_price = 20000;

f = @(x) objective_function(x, initial_price);

nonlcon = @(x) nonlinear_constraint(x, initial_price);

lb = zeros(24,1);
% resale price can't be lower than 10000 euro
lb(1:12,1) = 10000;
ub(1:12,1) = 20000 * ones(12,1);
ub(13:24,1) = 200 * ones(12,1);

x0 = zeros(24,1);
x0(1:12) = 20000;

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');

[xstar,fval,exitflag,output,lambda] = fmincon(f,x0,[],[],[],[],lb,ub,nonlcon,options)