function [K, gradK ] = wall_thickness_w_gradient (x)

c0 = 20000;
c1 = 300;
c2 = 400;

% Bedeutung der Variablen
% x (1) = d1 = Wandstaerke Material 1 [ cm ]
% x (2) = d2 = Wandstaerke Material 2 [ cm ]
d1 = x(1) ;
d2 = x(2) ;
% Berechnung der Zielfunktion
K = c0 * (1/ d1 + 1/ d2 ) + c1 * d1 + c2 * d2 ;

gradK(1) = c0 * ( -1/ d1 ^2 + 0) + c1 + 0;
gradK(2) = c0 * (0 + -1/ d2 ^2) + 0 + c2 ;
