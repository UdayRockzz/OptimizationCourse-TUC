% Edges of the network with start nodes, end nodes and probability
% for a successful transmittion 
network = [
          1,2, 0.91;
          1,4, 0.98;
          1,5, 0.94;
          2,3, 0.98;
          2,5, 0.99;
          2,6, 0.99;
          3,6, 0.98;
          4,5, 0.98;
          4,7, 0.94;
          5,6, 0.92;
          5,7, 0.97;
          5,8, 0.93;
          6,9, 0.97;
          7,8, 0.99;
          8,6, 0.98;
          8,9, 0.95;
          ];
%  first node of the path
sender     = 1;
%  last node of the path
receiver = 9;
      
% node colors
node_colors = ones(9,1)*[1.0 1.0 0.8]; % standard color
node_colors(sender,:) = [1 0 0]; % sender is red 
node_colors(receiver,:) = [1 0 0];% receiver is red
