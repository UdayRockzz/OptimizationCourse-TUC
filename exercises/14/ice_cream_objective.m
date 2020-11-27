function [ cost ] = ice_cream_objective( x )

    cost = 0;
    k = @(a) 300*a + 0.3*a^2;
    for i=1:length(x)/2
        cost = cost + k(x(i)) + 30*x(i+12); 
    end

%     cost = 300*x(1)+0.3*x(1)^2+30*x(2);

end

