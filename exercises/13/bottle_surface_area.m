function [area] = bottle_surface_area(x, r2)

r1 = x(1);
h1 = x(2);
h2 = x(3);

x = h2*r2/(r1-r2);

s_small_cone = pi*r2*sqrt( r2^2 + x^2 );
s_big_cone = pi*r1*sqrt( r1^2 + (x+h2)^2 );
s_cylinder_side = 2*pi*r1*h1;
s_cylinder_bottom = pi*r1^2;

area = s_cylinder_side + s_cylinder_bottom + s_big_cone - s_small_cone;

end