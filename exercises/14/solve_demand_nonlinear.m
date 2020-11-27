clear all 
% Bedarf / demand
d = [180;200;260;320;420;480;780;800;780;420;360;780];
% Anzahl der Zeitintervalle / number of time intervals 

% Zielfunktion / objective function
f = @(x) ice_cream_objective(x);

% lineare Ungleichungen / linear inequalities
% Aeqin = [zeros(12,12),eye(12,12)];
% beqin = 60*eye(12,1);
Aineq = [];
bineq = [];


% lineare Gleichungen / linear equalities

Aeq = [eye(12), -eye(12) + [zeros(1,12); eye(11,12)]];
beq = d;


% untere und obere Grenzen / lower and upper bounds
low = zeros(1,24);
up(1:12) = inf;
up(13:24) = 600;

% Startvektor / initial vector
x0 = zeros(24,1);


options = optimoptions('fmincon','Display', 'iter','Algorithm', 'sqp');
% Aufruf des Optimierungsverfahrens / call of the solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,Aineq,bineq,Aeq,beq,low,up,[],options);
if (exitflag~=1) exitflag, end
% Loesung / solution
n = length(d);
TotalCosts = fval
Production = round( x(1:n)')
Storage = round( x((n+1):(2*n))' )

% Balkendiagramm / bar diagram
figure(1);clf
axis([0 13 0 1200])
xlabel('Month');
ylabel('units');
hold on
% demand
bar1=bar(d, 'FaceColor', [0.8 0.8 0.8],'BarWidth',1); 
% production + storage
bar2=bar(Production+[0,Storage(1:11)], 'FaceColor', 'b','BarWidth',0.6); 
% production
bar3=bar(Production, 'FaceColor', 'g','BarWidth',0.6); 
legend('demand','from storage','production','Location','NorthWest')
%for i=1:n
%    text(i-0.22,d(i)+30,num2str(d(i)))
%end
