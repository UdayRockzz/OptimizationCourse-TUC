% data for the edges in the power network
% each line corresponds to connection between start node, end node 
% and transport limits
power_connections = [ 
        1, 2, 1000;
        1, 4,  700;
        2, 3,  600;
        2, 4,  200;
        3, 4,  400;
        3, 5,  200;
        3, 8,  300;
        4, 5,  600;
        4, 6,  600;
        5, 7,  400;
        5, 8,  400;
];

% source nodes
source = [1]; 
% nodes that are sinks
sinks = [6;7;8]; 




% %%
% 
% artifical_sink = 9;
% 
% edges_to_artifical_sink = [
%     sinks(1), artifical_sink, inf;
%     sinks(2), artifical_sink, inf;
%     sinks(3), artifical_sink, inf
%     ];
% 
% power_connections = [power_connections; edges_to_artifical_sink];
% 
% Ain = edge2inc_draft(power_connections(:,1:2));
% 
% [no_nodes, no_edges] = size(Ain);
% c = zeros(no_edges,1);
% c(end) = -1;
% low = zeros(no_edges,1);
% upp = power_connections(:,3);
% b = zeros(no_nodes,1);
% 
% options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');
% 
% % this version of matlab reqires x0 value so just passing an empty matrix
% x0 = [];
% 
% % Aufruf des Optimierungsverfahrens / call of the simplex method
% [x,fval,exitflag,output,lambda] = linprog(c,[],[],Ain,b,low,upp,x0,options);


%%

% node colors for the visualization
node_colors = ones(max(max(power_connections(:,[1,2]))),1)*[1.0 1.0 0.8]; % standard color
node_colors(source,:) = [0.2 0.4 1]; % blue
for i=1:length(sinks)
    node_colors(sinks(i),:) = [0 1 0]; % green
end

% if (exitflag~=1) exitflag, end % Test auf Konvergenz / check for convergence
% % Darstellung der Loesung / visualization of the solution
% h = Graph(Ain,[],[],[x,upp], '-nodeColors', node_colors);
% axis off
