function [ out ] = breaking_distance_graph_func( x1, x2 )
%BREAKING_DISTANCE_GRAPH_FUNC Summary of this function goes here
%   Detailed explanation goes here

v = [10; 20; 25; 30; 40; 50];
d = [4; 10; 14; 20; 30; 42];

for i=1:length(x1)
    for j=1:length(x1)
        out(i,j) = sum(((x1(i,j).*v + x2(i,j).*v).* 1000 - d).^2);
    end
end

end

