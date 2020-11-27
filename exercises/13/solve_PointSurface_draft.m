clear all
% gegebener Punkt / given point

% Zielfunktion / objective function

% nichtlineare Nebenbedingungen / nonlinear constraints

% Startpunkt / initial point


options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% Aufruf des Optimierungsverfahrens / call of the solver
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(f,x0,[],[],[],[],[],[],gh,options);
if (exitflag~=1) exitflag, end
% Loesung / solution
disp(['Closest point of P on surface is   ', num2str(x')])
disp(['with a distance of ',num2str(sqrt(fval))])

% Loesung zeichnen / plot the solution

N = 30; % discretization parameter
w = [-4 4 -4 4 -4 4]; % range of window
% generate grid
xspace = zeros(N,3);
for i=1:3
    xspace(:,i) = (0:(N-1))/(N-1)*(w(2*i)-w(2*i-1)) + w(2*i-1);
end
[x1,x2,x3] = meshgrid(xspace(:,1),xspace(:,2),xspace(:,3));
% evaluate h at the grid nodes
V = zeros(N,N,N);
for i=1:N
    for j=1:N
        for k=1:N
            [~,V(i,j,k)]=gh([x1(i,j,k);x2(i,j,k);x3(i,j,k)]);
        end
    end
end

% plot points    
figure(1); clf, hold on
axis equal
plot3(P(1),P(2),P(3),'ko','MarkerSize',5,'LineWidth',2);
text(P(1),P(2),P(3)+0.4,'P','FontSize',25)
plot3(x(1),x(2),x(3),'kx','MarkerSize',10,'LineWidth',2);
plot3([x(1),P(1)],[x(2),P(2)],[x(3),P(3)],'-k','LineWidth',2);
% plot surface
p = patch(isosurface(x1,x2,x3,V,0));
isonormals(x1,x2,x3,V,p);
set(p,'FaceColor','green','EdgeColor','none','FaceLighting','phong','FaceAlpha',0.6);
grid on
camlight left;
xlabel('x1'); ylabel('x2'); zlabel('x3');
axis( w);
title('Closest Point of P on the Surface');
