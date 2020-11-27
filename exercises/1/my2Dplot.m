clear % delete all variables in workspace

% fix range for plotting for x1 and x2 
x1_vector = linspace(-10,10,100); % e.g. range from -8 to 12 with 50 points for quadratic function
x2_vector = linspace(-10,10,100);

% calculate function values z = f(x1,x2) 
for i = 1:length(x1_vector)
  x1 = x1_vector(i);
  for j = 1:length(x2_vector)
    x2 = x2_vector(j);
		% matrix f contains in the j-th row and i-th column the function value f(x1_vector(i),x2_vector(j))
		f(j,i) = abs(x1-x2);
		% f(j,i) = quadFct([x1;x2]);
		% f(j,i) = rosenbrockFct([x1;x2]);
		% f(j,i) = periodicFct([x1;x2]);
  end
end

% generate plot
figure(1); clf   % optional: choose figure and delete its content
surfc(x1_vector,x2_vector,f,'FaceAlpha',1.0,'FaceColor','interp');
% axes label
xlabel('x_1'); %x-axis
ylabel('x_2'); %y-axis
zlabel('f(x_1,x_2)'); %z-axis
title('distance function f(x_1,x_2)');
%title('quadratic function f(x_1,x_2)');
%title('Rosenbrock function f(x_1,x_2)');
%title('periodic function f(x_1,x_2)');

