function [ l ] = landscape( xy )

f = @(x) 2/(1+x^2);
n = size(xy,1);
l = zeros(n,1);

for i=1:n
    x = xy(i,1); y = xy(i,2);
    a1 = -f(3-0.7*x^2-5*y);
    a2 = f(5*(x-0.7)^2+20*(y-0.1)^2);
    a3 = f(4+2*x^2-4*y);
    a4 = 0.5*sin(4*(x-y^2))*sin(3*(y+x^2));
    a5 = 0.6*f(50*((x+1)^2+(y+0.8)^2-0.25)^2);
    % l(i) = a5;
    l(i) = (a1+a2+a3+a4+a5-1/6)/8;
end

end

