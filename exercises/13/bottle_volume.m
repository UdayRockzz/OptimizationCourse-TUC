function [g,h] = bottle_volume(x, r2, v)

r1 = x(1);
h1 = x(2);
h2 = x(3);

% inequalities
g = [];

% equalities
x = h2*r2/(r1-r2);
v_small_cone = pi*r2^2*x/3;
v_big_cone = pi*r1^2*(x+h2)/3;
v_cylinder = pi*r1^2*h1;
volume = v_cylinder + (v_big_cone - v_small_cone);

h = volume - v;

end