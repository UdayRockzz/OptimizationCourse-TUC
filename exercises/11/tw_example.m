% Beschreibung DEUTSCH:
% erstellt folgende Matrizen/Vektoren
% pos     - mx2 Matrix: die 2D-Positionen der m Knoten
% E       - nx2 Matrix: die n Kanten mit ihren Start und Endknoten
% bearing - Vektor: die gelagerten Komponenten der Knoten. Sortierung: zuerst
%             alle x-Komp. dann alle y-Komp.
%             z.B. lager = [1,11] bei m=10 bedeutet,dass x- und y-Komp. des
%             Knoten 1 fest gelagert sind 
% b       - Vektor: angreifende Kraefte. Sortierung: zuerst alle x-Komp.,
%             dann alle y-Komp.

% Description ENGLISH
% builds the following matrices/vectors:
% pos     - mx2 matrix: 2D-positions of the m nodes
% E       - nx2 matrix: the n edges with start and end node
% bearing - vector: the nodes' components supported by bearings. 
%             Sorting: x-components first, than y-components
%             e.g. bearing = [1,11] at m=10 means, 
%             that x- and y-component of node 1 is supported by bearings. 
% b       - vector: forces. Sorting: x-components first, than y-components

% Positionen der Gelenke (= Knoten) / positions of joints (= nodes)
pos = [
        0, 0;
        1, 0;
        2, 0;
        2, 0.4;
        1, 0.4;
        0, 0.4;
];

% Staebe / bars (= edges)
E = [
        1,2;
        6,5;
        1,5;
        6,2;
        2,5;
        2,3;
        5,4;
        2,4;
        5,3;
        3,4;
        1,6;
];
% Lasten / forces
bx = [0;0;0;0;0;0];
by = [0;0;0;-0.4;0;0;];
b = [bx; by];

% Lagerungen fuer die Knoten / bearings for the nodes
bearing_x = [1,6];
bearing = [bearing_x,bearing_x+6];
