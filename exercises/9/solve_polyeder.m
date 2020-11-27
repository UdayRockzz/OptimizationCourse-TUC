clear all

% this version of matlab reqires x0 value so just passing an empty matrix
x0 = [];

% Anzahl der Halbebenen und Dimension / number of halfplanes and dimension
% Matrix A um die Norm erweitern / extend matrix A with the norm
% Ungleichungen / inequalities
% Halbebenen definieren / define half planes
% Kostenvektor / cost vector


A = [ 0 -1; -1 0 ; 1 -1; 1 2 ];
b = [ 0; 0; 1; 4];

x = [ 2; 2];

d = (A*x-b)./sqrt(A(:,1).^2+A(:,2).^2);


r = sqrt(A(:,1).^2+A(:,2).^2);
Aineq = [A,r];
bineq = b;

Aeq = [];
beq = [];

cost = [0; 0; -1];

lb = zeros(size(cost));
ub = [];


options = optimoptions('linprog', 'Algorithm','dual-simplex','Diagnostics','on', 'Display', 'iter');

[xstar, fstar, exitflag, output, lambda] = linprog(cost, Aineq, bineq, Aeq, beq, lb, ub, x0, options);

% max_tent_profit = abs(cost')*xstar
% options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');
% 
% [xstar,fval,exitflag,output,lambda] = ...
% linprog(c,Aineq,bineq,[],[],[],[],[],options);

d = 2;
n = 4;
x = xstar;

% 2D Plot
if (d==2)
    E = 1e1;
    figure(1);clf
    axis([-0.5 2.5 -0.5 2.5]) ;
    hold on   
    for i=1:n
        clear x1 x2 f1 f1;
        if (A(i,2) ~= 0)
            x1 = [-E,E]; f1=[x1,fliplr(x1)]; 
            x2 = (b(i) - A(i,1)*x1)/A(i,2);
            f2 = (b(i)+E - A(i,1)*fliplr(x1))/A(i,2); f2 = [x2,f2];
        else if (A(i,1) ~= 0)
                x2 = [-E,E]; f2=[x2,fliplr(x2)] ;
                x1 = (b(i) - A(i,2)*x2)/A(i,1);
                f1 = (b(i)+E - A(i,2)*fliplr(x2))/A(i,1); f1 = [x1,f1];
            end
        end
        fill(f1,f2,[0.9,0.9,0.9])
    end 
  
    for i=1:n
        clear x1 x2 f1 f1;
        if (A(i,2) ~= 0)
            x1 = [-E,E];
            x2 = (b(i) - A(i,1)*x1)/A(i,2);
        else if (A(i,1) ~= 0)
                x2 = [-E,E];
                x1 = (b(i) - A(i,2)*x2)/A(i,1);
            end
        end
        plot(x1,x2,'-k') 
    end 
  
    plot(x(1),x(2),'b+')
    t=[0:0.01:2*pi];
    plot([x(1)+x(3)*cos(t)],[x(2)+x(3)*sin(t)],'-b');
end

