function f = rosenbrockFct(x)
x1 = x(1);
x2 = x(2);
f = (1-x1)^2 + 100*(x2-x1^2)^2;
end