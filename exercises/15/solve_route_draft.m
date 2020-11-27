clear all
% Anzahl Streckenpunkte / number line points
n = 40;
% Kosten / costs
C = [ 1 ; 100 ];
% maximale "Laenge" einer Teilstrecke/ maximal range of a line
max_d = 4/(n-1);

% lineare Gleichungen / linear equalities
Aeq = zeros(4,2*n); 
Aeq(1,1) = 1;
Aeq(2,n) = 1;
Aeq(3,n+1) = 1;
Aeq(4,2*n) = 1;
beq = [-1;1;-1;1];

% Landschaftsfunktion / landscape function
l = @(x) landscape(x);
%
f  = @(x)  f_route( [x(1:n), x(n+1:2*n)], l, C );
gh = [];

% lineare Ungleichungen / linear inequalities
A = [ eye(n-1,n)- [zeros(n-1,1),eye(n-1,n-1)] ];
A0= zeros(n-1,n);
Aineq = [A,A0;-A,A0;A0,A;A0,-A];
bineq = max_d*ones(4*(n-1),1);


% Startstrecke / initial route
% x0 = 

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
options.MaxFunEvals = 1e5;
% Aufruf des Optimierungsverfahrens / call of solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,Aineq,bineq,Aeq,beq,[],[],[],options);
if (exitflag<1) exitflag, end

solution = [x(1:n),x(n+1:2*n)];

disp(['  length of Route  = ',num2str(f_route(solution,l,[1,0]))])
disp(['  penalty (height) = ',num2str(f_route(solution,l,[0,C(2)]))])

plot_route(solution,l,@gh_route);
