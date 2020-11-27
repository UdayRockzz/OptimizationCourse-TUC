clear all
% zufaellige Punkte generieren / generate random points
A = rand(3,2);
% initial point



% ERSTENS: Formulierung mit max in Zielfunktion (ohne Nebenbedingungen)
% FIRST:   Formulation with max in goal function (without constraints)

% % Aufruf quasi-Newton-Verf. / call quasi-Newton method
% options = optimoptions('fminunc');
% options = optimoptions(options,'Display', 'off');
% options = optimoptions(options,'Algorithm', 'quasi-newton');
% %options = optimoptions(options,'FinDiffType', 'central');
% [x1,fval1,exitflag1,output1,grad,hessian] = ...
% fminunc(f1,[x0],options);
% % Ausgabe der Loesung / solution output
% M1=x1;r1=sqrt(fval1);
% disp(' '),disp(['Formulation with Max in f'])
% if (exitflag1<1) disp(['  exitflag = ',num2str(exitflag1)]), end
% disp(['  circle M = ( ',num2str(M1),' ), r = ',num2str(r1) ])
% disp(['  fctcount = ',num2str(output1.funcCount) ])

% ZWEITENS: Formulierung mit Nebenbedingen
% SECOND:   Formulation with constraints


f2 = @(x) x(3);
gh = @(x) min_radius_constraint(x,A);
x0 = [0 0];
r0 = [10];

% Aufruf SQP-Verf. / call SQP method
options2 = optimoptions('fmincon');
options2 = optimoptions(options2,'Display', 'iter');
options2 = optimoptions(options2,'Algorithm', 'sqp');
[x2,fval2,exitflag2,output2,lambda,grad,hessian] = ...
fmincon(f2,[x0,r0],[],[],[],[],[],[],gh,options2);

% Ausgabe der Loesung / solution output
M2=x2(1:2);r2=x2(3);
disp(' '),disp(['Formulation with inequality constraints'])
if (exitflag2<1) disp(['  exitflag = ',num2str(exitflag2)]), end
disp(['  circle M = ( ',num2str(M2),' ), r = ',num2str(r2) ])
disp(['  fctcount = ',num2str(output2.funcCount) ])
disp(' ')

% Zeichnen der Loesungen / plot the results
% blauer Kreis - max in f , schwarzer Kreis - mit Nebenbedingungen
%  blue circle - max in f ,    black circle - with constraints
figure(1);clf, axis equal
axis([ -0.2 1.2 -0.2 1.2])
hold on
% plot Points
plot(A(:,1),A(:,2),'rx','LineWidth',2)
% plot Circle 1
plot(M1(1),M1(2),'bx')
t=[0:0.01:2*pi]';
x1t=r1*cos(t)+M1(1);
y1t=r1*sin(t)+M1(2);
plot(x1t,y1t,'-b')
% plot Circle 2
plot(M2(1),M2(2),'kx','LineWidth',2)
x2t=r2*cos(t)+M2(1);
y2t=r2*sin(t)+M2(2);
plot(x2t,y2t,'-k','LineWidth',2)
