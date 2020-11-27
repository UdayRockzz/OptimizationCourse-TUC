% fest gegebene Groessen /fixed values

h1 = 15;
h2 = 5;
r1 = 3.5;
r2 = 0.8;

x0 = [r1; h1; h2];
v = 1500;

% Zielfunktion / objective function
f = @(x) bottle_surface_area(x,r2);

% nichtlineare Nebenbedingungen / nonlinear constraints
gh = @(x) bottle_volume(x,r2,v);

% lineare Nebenbedingungen / linear constraints
Aineq = [0 -1 -1];
bineq = [-20];

Aeq = [];
beq = [];

% Startpunkt / initial point

lb = [ 0 0 0];
ub = [];

options = optimoptions('fmincon','Display', 'iter','Algorithm', 'sqp');
% Aufruf des Optimierungsverfahrens / call of solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,Aineq,bineq,[],[],lb,ub,gh,options);
if (exitflag~=1) exitflag, end

% Loesung / solution
r1 = x(1); h1 = x(2); h2 = x(3);
disp(['r1 = ',num2str(r1),',  r2 = ',num2str(r2),...
   ',  h1 = ',num2str(h1),',  h2 = ',num2str(h2),])

% optimale Flasche zeichnen / plot the optimal bottle
figure(1); clf
axis equal

% Buttom of the bottle
[X,Y,Z] = cylinder([1,0]);
surf(r1*X,r1*Y,0*Z,'FaceColor','yellow')
% Side of the bottle
hold on
[X,Y,Z] = cylinder;
surf(r1*X,r1*Y,h1*Z,'FaceColor','yellow')
% frustrum (upper part of the bottle)
[X,Y,Z] = cylinder([1,r2/r1]);
surf(r1*X,r1*Y,h2*Z+h1,'FaceColor','yellow')


