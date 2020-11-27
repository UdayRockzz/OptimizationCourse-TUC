% Daten zu der Aufgabe des Wassertransports // Data related to the exercise with the water transport prolbem

% % Strassen mit ihrem Start- und Endknoten, den Kosten pro Transport und
% % Transportlimit pro Monat //
% % Tail and head vertices of the streets, costs of the transport on the streets and 
% % the limit of the number of transports per month
% Strassen = [
%              1, 8,  9.6, 500;
%              8, 7,  6.9, 300;
%              7, 3,  7.7, 300;
%              7, 9,  5.7, 300;
%              8, 9,  8.8,  50;
%              1,10, 12.5, 300;
%              8,11, 12.5, 500;
%              9, 4,  7.4, 200;
%              2,10, 12.4, 500;
%             10,11,  7.8, 100;
%             11, 4, 11.1, 500;
%              4,12, 12.5, 400;
%             10,14, 14.3, 400;
%             11,14,  9.0, 300;
%             11,13, 10.1, 200;
%             14,13,  8.2, 100;
%             13,12,  4.7, 100;
%             13, 5, 12.2, 500; % 500; % 100;
%             12, 5, 11.3, 300;
%             14, 6, 10.6, 500;
%             1, 15, 0, inf;
%             2, 15, 0, inf;
%             ];
%         
%         
%         
% % Trinkwassererzeugung der Anlagen bzw. -verbrauch der Sammelknoten pro Monat //
% % Water production and demand of the nodes per month
% Wasser = [
%                   -700;
%                   -400;
%                    100;
%                    200;
%                    400;
%                    300;
%                      0;0;0;0;0;0;0;0;100;
% ];

% Strassen mit ihrem Start- und Endknoten, den Kosten pro Transport und
% Transportlimit pro Monat //
% Tail and head vertices of the streets, costs of the transport on the streets and 
% the limit of the number of transports per month
Strassen = [
             1, 8,  9.6, 500;
             8, 7,  6.9, 300;
             7, 3,  7.7, 300;
             7, 9,  5.7, 300;
             8, 9,  8.8,  50;
             1,10, 12.5, 300;
             8,11, 12.5, 500;
             9, 4,  7.4, 200;
             2,10, 12.4, 500;
            10,11,  7.8, 100;
            11, 4, 11.1, 500;
             4,12, 12.5, 400;
            10,14, 14.3, 500;
            11,14,  9.0, 300;
            11,13, 10.1, 200;
            14,13,  8.2, 100;
            13,12,  4.7, 100;
            13, 5, 12.2, 500; % 100;
            12, 5, 11.3, 300;
            14, 6, 10.6, 500;
            ];
        
        
% Trinkwassererzeugung der Anlagen bzw. -verbrauch der Sammelknoten pro Monat //
% Water production and demand of the nodes per month
Wasser = [
                  -600;
                  -400;
                   100;
                   200;
                   400;
                   300;
                     0;0;0;0;0;0;0;0;
];



% Knotenfarben fuer die Visualisierung // color of the nodes for the visualization
knotenfarben = ones(length(Wasser),1)*[1.0 1.0 0.8]; % Standardfarbe // standard color
for i=1:length(Wasser)
    if Wasser(i)<0 % Knoten ist eine Wasseraufbereitungsanlage // node is related to a water treatment plant
        knotenfarben(i,:) = [0.2 0.4 1]; % blau // blue
    end
    if Wasser(i)>0 % Knoten ist ein Sammelpunkt // node is related to a collection point
        knotenfarben(i,:) = [0 1 0]; % gruen // green
    end
end
