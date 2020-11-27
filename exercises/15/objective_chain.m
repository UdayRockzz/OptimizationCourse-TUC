function [result] = objective_chain(x,w)

result = 0;
for i=1:size(w,1)
    result = result + w(i)*x(i+11);
end
    
end