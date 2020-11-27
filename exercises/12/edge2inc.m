function [ Ain ] = edge2inc( E )
% generates an incidence matrix from an edge matrix
% of the following form
% [ start_node1 end_node1; ...
%   start_node2 end_node2; ...
%   ...
% ];

% bring E into the right format: size(E)=[n,2]
if ( size(E,2)~=2)
    if ( size(E,1)~=2)
        disp('Error: wrong format for Edges')
        Ain = [];
        return
    end
    E = E';
end

% number of edges
no_edges = size(E,1);

% largest node = number of nodes
no_nodes = max(E(:));

% build incidence matrix
Ain = zeros(no_nodes, no_edges);
for i=1:no_edges
    Ain(E(i,1),i) = -1;
    Ain(E(i,2),i) = 1;
end

end
