clear all
% Laden der Daten / load data
data_wireless_network; %Daten_Drahtlosnetzwerk;

% Kantenmatrix / edge matrix 
% E = ...
E = edge2inc(network(:,1:2));

% Anzahl Kanten / number of edges
% n = ...
no_vertices = size(E,1);
no_edges = size(E,2);

% Gleichungen / equalities
% A = ...
% b = ...
A = E;
b = zeros(no_vertices,1);
b(1) = -1; b(end) = 1;
% untere und obere Schranken / lower and upper bounds
% low = ...
% upp = ...
low = zeros(no_edges,1);
upp = ones(no_edges,1);

% Kostenvektor / cost vector
% c = ...
c = -log(network(:,3));


options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');

% this version of matlab reqires x0 value so just passing an empty matrix
% x0 = [];

% Aufruf des Simplex-Verf. / call simplex method
[x,fval,exitflag,output,lambda] = linprog(c,[],[],A,b,low,upp,[],options);

if (exitflag~=1) exitflag, end % Test auf Konvergenz / check convergence

% Zuverlaesslichkeit berechnen / calculate reliability
disp(['reliability = ',num2str(100*prod(network(:,3).^x)),' %'])

% Einfaerben des Loesungspfades / paint the solution red
colors = []; 
for i=1:length(x)
    if (x(i) == 1)
        colors = [colors; {num2str(network(i,1)),num2str(network(i,2)),'r'}];
    end
end

% Darstellung der Loesung / visualization of the solution
h = Graph(A,[],[],[network(:,3)], '-nodeColors', node_colors, '-edgeColors', colors);
