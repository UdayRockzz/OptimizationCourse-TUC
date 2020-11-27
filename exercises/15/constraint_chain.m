function [c,ceq] = constraint_chain(x, l)

c = [];
ceq = zeros(size(l,1));
for i=1:size(x,1)/2-1
    ceq(i) = (x(i)-x(i+1))^2 + (x(i+11)-x(i+12))^2 - l(i)^2;
end

end

