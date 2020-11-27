clear allhttps://www.tu-chemnitz.de/mathematik/part_dgl/teaching/WS2017_Optimierung_f%C3%BCr_Nichtmathematiker/index.en.php
% Daten lad / load data: Strasse (streets) & Wasser(water)
Daten_Wassertransport;


% Anzahl der Strassen / number of streets
no_streets = size(Strassen,1);

% Kantenmatrix / edge matrix
Ain = edge2inc(Strassen(:,1:2));

% Gleichungen / equalities
b = Wasser;

% Wasserproduktion und -bedarf / water production and demand

% untere und obere Shranken / lower and upper bounds
low = zeros(no_streets,1);
low(end-3) = -1;
upp = Strassen(:,4);

% Kostenvektor / cost vector
c = Strassen(:,3);

options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');

% this version of matlab reqires x0 value so just passing an empty matrix
x0 = [];

% Aufruf des Optimierungsverfahrens / call of the simplex method
[x,fval,exitflag,output,lambda] = ...
linprog(c,[],[],Ain,b,low,upp,x0,options);
if (exitflag~=1) exitflag, end % Test auf Konvergenz / check for convergence
% Darstellung der Loesung / visualization of the solution
h = Graph(Ain,[],[],[x,upp], '-nodeColors', knotenfarben);
axis off
 

