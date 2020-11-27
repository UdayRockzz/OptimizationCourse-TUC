function [  ] = plot_route( x, l, gh, x0 )
% plots the function graph of the landscape l and the route on it

if nargin<4
    x0=[];
end

% drawing range for x1 and x2
x1_vector = linspace(-1.5,1.5,45);
x2_vector = linspace(-1.1,1.1,45);
L = zeros(length(x2_vector),length(x1_vector));
G = zeros(length(x2_vector),length(x1_vector));
% evaluate the landscape function
if (isempty(gh)==1)
    for i = 1:length(x1_vector)
      x1 = x1_vector(i);
      for j = 1:length(x2_vector)
        x2 = x2_vector(j);
        L(j,i) = l([x1,x2]);
      end
    end
else
    for i = 1:length(x1_vector)
      x1 = x1_vector(i);
      for j = 1:length(x2_vector)
        x2 = x2_vector(j);
        L(j,i) = l([x1,x2]);
        [G(j,i),~] = gh([x1,x2]);
      end
    end
end


% plot landscape
figure(); clf, hold on, set(1,'Color',[1 1 1]);
axis([-1.6 1.6 -1.1 1.1]);
axis equal
axis off
h = [-0.4:0.05:0.4];
contour3(x1_vector,x2_vector,L,h);
surf(x1_vector,x2_vector,L,'FaceColor','interp','FaceAlpha',0.6,...
   'EdgeColor','none','LineStyle','none','FaceLighting','phong');
% xlabel('x_1');
% ylabel('x_2');
% zlabel('l(x_1,x_2)');
% title('Landscape');

% plot route
if (isempty(x)~=1)
    % refine route
    route = refine_route(x,0.05);
    n = size(route,1);

    lroute = l(route)+0.01;
    %plot3(route(:,1),route(:,2),lroute,'-k','LineWidth',1);
    plot3(route(:,1),route(:,2),zeros(n,1),'-k','LineWidth',3);
    for i=1:n
        if (lroute(i)<0) % draw bridges
            x1 = route(i,1); x2 = route(i,2);
            plot3([x1,x1],[x2,x2],[0,lroute(i)],'-k','LineWidth',1.5);
        end
    end
    text(route(1,1),route(1,2),lroute(1)-0.15,'A','FontSize',40)
    text(route(n,1),route(n,2),lroute(n)+0.1,'B','FontSize',40)
end

% plot initial route
if (isempty(x0)~=1)
    % refine route
    route = refine_route(x0,0.05);
    n = size(route,1);

    lroute = l(route)+0.01;
    %plot3(route(:,1),route(:,2),lroute,'-k','LineWidth',1);
    plot3(route(:,1),route(:,2),zeros(n,1),'--r','LineWidth',3);
    for i=1:n
        if (lroute(i)<0) % draw bridges
            x1 = route(i,1); x2 = route(i,2);
            plot3([x1,x1],[x2,x2],[0,lroute(i)],'--r','LineWidth',1.5);
        end
    end
end


% plot restricted areas
if (isempty(gh)~=1)
    contour(x1_vector,x2_vector,G,[0.001;0.001],'EdgeColor',[0 0 0])
end

% view([-80 30])

%saveas(gcf,'route.pdf');

end

function [ refined ] = refine_route( x, s )

refined = x(1,:);
for i=1:size(x,1)-1
    dx = norm(x(i,:)-x(i+1,:));
    nh = round(dx/s);
    for h=linspace(1/nh,1,nh)
        refined = [ refined; (1-h)*x(i,:) + h*x(i+1,:)];  
    end
end

end
