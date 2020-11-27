clear all
clc

cost = [2*6500; 2.5*5800; 1.5*6200; 2*5900];

Aineq = [6500 5800 6200 5900; ...
            0.2 0.35 0.15 0.11; ...
            0.05 0.015 0.065 0.1;...
            -6500 -5800 -6200 -5900; ...
            -0.2 -0.35 -0.15 -0.11; ...
            -0.05 -0.015 -0.065 -0.1];
bineq = [6050; 0.3; 0.055; -5950; -0.1; -0.045];

Aeq = [1 1 1 1];
beq = [1];

lb = [zeros(size(cost))];
ub = [];

% this version of matlab reqires x0 value so just passing an empty matrix
x0 = [];

options = optimoptions('linprog', 'Algorithm','dual-simplex','Diagnostics','on', 'Display', 'iter');

[xstar, fstar, exitflag, output, lambda] = linprog(cost, Aineq, bineq, Aeq, beq, lb, ub, x0, options);

min_cost = abs(cost')*xstar