clear all
% Daten laden / load settings
tw_example
% tw_beam
% tw_bridge

% Matrix erstellen / build matrix
% Inzidenzmatrix enthaelt die Kraeftegleichgewichte / incidence matrix
% contains balance of forces
% Sortierung: erst die x-Komponenten / sorting: x-components first
m = size(pos,1); n = size(E,1); 
A = zeros(2*m,n); c = zeros(n,1);
for e=1:n
    % Start- und Endknoten / start and end node
    
    % Verbindungsvektor zwischen den Knoten / vector between nodes
    
    % Kosten = Laenge des Vektors / costs = length of the vector
    
    % Normierung / scaling
    
    % Inzidenzmatrix aufbauen / build incidence matrix
    % Matrixeintraege / matrix entries 

    
    
    
end

% Gleichungen / equalities


% Kostenvektor anpassen / adapt cost vector

% untere Schranke / lower bound

% Halterungen einbauen / apply anchors



options = optimoptions('linprog','display','iter');
% Aufruf des Simplex-Verf. / call simplex method
[x,fval,exitflag,output,lambda] = ...
linprog(c,[],[],Aeq,beq,low,[],[],options);
if (exitflag~=1) exitflag, end
solution = x(1:n)-x((n+1):(2*n));

plot_structure( pos, E, solution, bearing, b );

