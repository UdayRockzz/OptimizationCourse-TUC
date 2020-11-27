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

% Gittergroesse festlegen / define grid size
mx = 28; meshx = 2.7*([1:1:mx]-1)/(mx-1); 
my = 19; meshy = 1.8*([my:-1:1]-1)/(my-1); 
m = mx*my; % Knotenzahl / number of nodes

% Kantenmuster / pattern for edges
Q = [
     0,0,0,0,0,0,0;
     0,0,0,0,0,0,0;
     0,0,0,0,0,0,0;
     0,0,0,0,1,0,0;
     1,1,1,1,1,1,1;
     1,0,1,0,1,0,1;
     0,1,1,0,1,1,0;
];

qn = (size(Q,1)-1)/2; qn1 = qn+1;


% Kanten erstellen / define edges
E = []; pos = zeros(m,2);
for y=1:my
    for x=1:mx
        % Position des Ausgangspunkts / position of the initial point              
        pos(x+mx*(y-1),:) = [meshx(x),meshy(y)];
        % Kanten von diesem Punkt aus / edges connected to this point
        for j=-qn:qn
            for i=-qn:qn
                x2 = x+i; y2 = y+j;
                if ((0<x2)&(x2<=mx)&(0<y2)&(y2<=my)&Q(qn1+j,qn1+i)==1)
                    E = [E; [x+mx*(y-1),x2+mx*(y2-1)] ];
                end
            end
        end
    end
end

% Kraefte setzen / set forces
b = zeros(2*m,1);
% vertikale Kraft an der Mitte des rechten Randes / vertical force at lower boundary
b(m+mx*round(my/2)) = -1;

% Lagerungen setzen / set bearings
na = round(my/6); bearing_x = [];
for i = -na:na
	bearing_x = [bearing_x, 1+mx*(round(my/2)-1+i) ];
end
bearing = [bearing_x,bearing_x+m];

disp(['Number of nodes = ', num2str(m)]);
disp(['Number of edges = ', num2str(size(E,1))]);
