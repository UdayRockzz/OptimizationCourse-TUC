function [ cost ] = offer_objective( x )

c1 = 0.8;
c2_1 = 0.83;
c2_2 = 0.78;
c3 = 0.85;

if x(2) <= 100
    cost = c1*x(1) + c2_1*x(2) + (c3 - c3*(x(3)/100)/100)*x(3);
else
    cost = c1*x(1) + c2_1*100 + c2_2*(x(2)-100) + (c3 - c3*(x(3)/100)/100)*x(3);
end

end

