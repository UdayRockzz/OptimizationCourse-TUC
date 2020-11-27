clear all

% Zielfunktion / objective function
f = @(x) offer_objective(x);

% nichtlineare Nebenbedingungen / nonlinear constraints
gh = [];

% lineare Nebenbedingungen / linear constraints
Aeq = [1 1 1];
beq = [1001];

Aineq = [];
bineq = [];

% Startpunkt / initial point
x0 = zeros(3,1);

% Bounds
lb = zeros(3,1);
ub = [400, 500, 600];

options = optimoptions('fmincon','Display', 'iter','Algorithm', 'sqp');
% Aufruf des Optimierungsverfahrens / call of solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,Aineq,bineq,Aeq,beq,lb,ub,gh,options);