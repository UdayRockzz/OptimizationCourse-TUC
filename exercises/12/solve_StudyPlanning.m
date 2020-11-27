clear all
% Daten einlesen / load data
load('P.mat')

% Anzahl der Probanden und Termine / number of probands and time slots
n_probands  = size(P,1);
n_timeslots = size(P,2);

% Kantenmatrix aufbauen / build edge matrix
E = [];

for i=1:n_probands
    non_zero_items = find(P(i,:));
    temp_edges = [];
    for j=1:length(non_zero_items)
        temp_edges = [temp_edges; [i,n_probands+non_zero_items(j)]];
    end
    E = [E; temp_edges];
end

A = edge2inc(E);
A = abs(A);

% Kantenanzahl / number of edges

no_edges = size(A,2);

% Gleichungen / equalities

b = ones(n_probands+n_timeslots,1);

% untere und obere Schranken / lower and upper bound
low = zeros(no_edges,1);
upp = ones(no_edges,1);

% Kostenvektor / cost vector
c = -ones(no_edges,1);

options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');
% Aufruf des Simplex-Verf. / call simplex method
[x,fval,exitflag,output,lambda] = linprog(c,A,b,[],[],low,upp,[],options);

n = no_edges;

% Ausgabe der Loesung / present solution
if (exitflag==1)
    n_part = 0;
    for k=1:n
        if x(k)==1
            j = E(k,2)-n_probands;
            i = E(k,1);
            disp(['Time slot ',num2str(j),': proband ',num2str(i)]);
            n_part = n_part +1;
        end
    end
    disp(['In total: ',num2str(n_part),' participants ']);
end
