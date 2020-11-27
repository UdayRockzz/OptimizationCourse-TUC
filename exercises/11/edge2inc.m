function [ Ain ] = edge2inc( E )
% generates an incidence matrix from the edges

% bring E into the right format: size(E)=[n,2]
if ( size(E,2)~=2)
    if ( size(E,1)~=2)
        disp('Error: wrong format for Edges')
        Ain = [];
        return
    end
    E = E';
end

ne  = size(E,1); % number of edges
nn  = max(max(E)); % largest node = number of nodes
Ain = zeros(nn,ne);
for i=1:ne
    Ain(E(i,1),i) = -1; Ain(E(i,2),i) = 1;
end
end

