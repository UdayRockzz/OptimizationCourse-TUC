clear all
clc

cost = [0.3; 1; 0.05; 0.08; 0.23; 0.48];


Aeq = [1254 1457 318 46 309 1725];
beq = [3000];

% anything can exceed except the calories
Aineq = [ 39 73 8 4 16 43; ...
            418 41 42 141 536 0; ...
            0 0 70 860 720 0];
bineq = [70; 800; 500];

lb = zeros(size(cost));
ub = [];

% this version of matlab reqires x0 value so just passing an empty matrix
x0 = [];

options = optimoptions('linprog', 'Algorithm','dual-simplex','Diagnostics','on', 'Display', 'iter');

[xstar, fstar, exitflag, output, lambda] = linprog(cost, -Aineq, -bineq, Aeq, beq, lb, ub, x0, options);

min_cost = abs(cost')*xstar