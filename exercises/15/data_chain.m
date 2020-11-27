n = 10; % number of chain links / Anzahl der Kettenglieder
l = 1.5; % length of chain (has to be at least 1) / Länge der Kette (größer 1)

Data.edges = [ (1:n)', (2:n+1)', (l/n)*ones(n,1) ];

Data.weights = ones(n+1,1);

Data.anchors = inf*ones(n+1,2);
Data.anchors(1,:) = [0, 0];
Data.anchors(n+1,:) = [1, 0];
