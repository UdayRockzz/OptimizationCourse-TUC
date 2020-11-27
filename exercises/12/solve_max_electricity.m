clear all
data_power_network;

% Kantenmatrix / edge matrix

% Kostenvektor / cost vector für tatsächliche Kanten

% obere Schranke vorbereiten / prepare upper bounds

% (kuenstliche) Kanten von den Senken zu der Quelle / 
%   (artifical) edge from sinks to source
   

%%

artifical_sink = 9;

edges_to_artifical_sink = [
    sinks(1), artifical_sink, inf;
    sinks(2), artifical_sink, inf;
    sinks(3), artifical_sink, inf;
    artifical_sink, source, inf;
    ];

power_connections = [power_connections; edges_to_artifical_sink];
% relaxing the bounds of edge btw node 1 and node 4
power_connections(2,3) = 800;

Ain = edge2inc(power_connections(:,1:2));

[no_nodes, no_edges] = size(Ain);
c = zeros(no_edges,1);
c(end) = -1;
low = zeros(no_edges,1);
upp = power_connections(:,3);
b = zeros(no_nodes,1);


% untere Schranke / lower bound

% Gleichungen / equalities

options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');
[x,fval,exitflag,output,lambda] = linprog(c,[],[],Ain,b,low,upp,[],options);

disp(['maximal flow = ',num2str(-fval)])
% Darstellung der Loesung / visualization of the solution
E_1 = power_connections(:,[1,2]);
A_1 = edge2inc(E_1);
n_1 = size(E_1,1);
h = Graph(A_1,[],[],[x(1:n_1),upp(1:n_1)], '-nodeColors', node_colors);
