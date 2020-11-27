
clear all
close all
clc

% res

%g(1) = ...  % side length a
%g(2) = ...  % diagonal d
%g(3) = ...  % height H
%g(4) = ...  % edge lenght s
%g(5) = ...  % surface height h

% v = [10; 20; 25; 30; 40; 50];
d = [2.8; 4.0; 4.5; 5.0; 4.7];

f = @(x,v) pyramide(x,v); 
% don't forget to include v, even tough you don't you use it since you are using lsqcurvefit
% bc it is waiting that kind of funct.                    
x0 = [2.8; 4.5];

options = optimoptions('lsqcurvefit','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
[xstar,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(f,x0,[],d,[],[],options);
