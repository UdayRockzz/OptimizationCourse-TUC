clear all
clc

cost = [-6; -20; -47];

Aineq = [5 12 25; 5 15 34; 4 16 40];
bineq = [500; 500; 520];

Aeq = [];
beq = [];

lb = zeros(size(cost));
ub = [];

% this version of matlab reqires x0 value so just passing an empty matrix
x0 = [];

options = optimoptions('linprog', 'Algorithm','dual-simplex','Diagnostics','on', 'Display', 'iter');

[xstar, fstar, exitflag, output, lambda] = linprog(cost, Aineq, bineq, Aeq, beq, lb, ub, x0, options);

max_tent_profit = abs(cost')*xstar

xstar