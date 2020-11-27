clear all
% Daten einladen / load data
data_chain
%data_mesh;

% Kantenanzahl / number of edges 
no_edges = size(Data.edges,1);

% Knotenanzahl und Dimension / number of nodes and dimension
no_nodes = size(Data.anchors,1);
no_dimensions = size(Data.anchors,2);

% Zielfunktion / objective function
f = @(x) objective_chain(x, Data.weights);

% nichtlineare Nebenbedingungen / nonlinear constraints
gh = @(x) constraint_chain(x, Data.edges(:,3));

% Startvektor / initial vector
x0 = zeros(22,1);
x0(12) = 1;

Aeq = zeros(4,22);
Aeq(1,1) = 1;
Aeq(2,11) = 1;
Aeq(3,12) = 1;
Aeq(4,22) = 1;
beq = zeros(4,1);
beq(2) = 1;       

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% Aufruf des Optimierungsverfahrens / call of solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,[],[],Aeq,beq,[],[],gh,options);
if (exitflag~=1) exitflag, end


% number of edges 
n = size(Data.edges,1);
% number of nodes
m = length(Data.weights);

% Loesung / solution
pos = [x(1:m),x((m+1):(2*m))];
% Loesung zeichnen / plot solution

% set figure
figure(1);clf,hold on, set(1,'Color',[1 1 1]);
axis equal
xmin = min(pos(:,1)); xmax = max(pos(:,1)); 
ymin = min(pos(:,2)); ymax = max(pos(:,2)); 
dx = 0.1*(xmax-xmin); dy = 0.1*(ymax-ymin);
axis ([xmin-dx xmax+dx ymin-dy ymax+dy])

% scale weights
w = Data.weights;
w = 30*w/max(w);
% plot nodes
for i=1:m
    plot(pos(i,1),pos(i,2),'k.', 'MarkerSize', w(i)+5)
end

% plot anchors
for i=1:m
    if (Data.anchors(i,1)~=inf) 
        plot(pos(i,1)-0.02*(xmax-xmin),pos(i,2),'k>','Markersize',10)
    end
    if (Data.anchors(i,2)~=inf) 
        plot(pos(i,1),pos(i,2)-0.05*(ymax-ymin),'k^','Markersize',10)
    end    
end

% plot edges
for i=1:n
    n1 = Data.edges(i,1);
    n2 = Data.edges(i,2);
    g = norm(pos(n2,:)-pos(n1,:)) - Data.edges(i,3); 
    X = pos([n1,n2],1);
    Y = pos([n1,n2],2); 
    plot(X,Y,'-r','LineWidth',3);
end
