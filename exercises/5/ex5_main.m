%% Exercise 11 - Braking Distance
clear all
close all
clc

v = [10; 20; 25; 30; 40; 50];
d = [4; 10; 14; 20; 30; 42];

f = @(x,v) braking_distance_model(x,v);

x0 = [1; 1];

options = optimoptions('lsqcurvefit','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
[xstar,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(f,x0,v,d,[],[],options);

PlotLSQ_Braking_Distance(xstar,d,v);

% g = @(x1,x2) sum(((x1*v.^2 + x2*v) * 1000 - d).^2);
g = @(x1,x2) breaking_distance_graph_func(x1,x2);

x1 = -5:0.1:5;
x2 = -5:0.1:5;

[X1,X2] = meshgrid(x1,x2);

g_ = g(X1,X2);

figure
surfc(x1, x2, g_)


%% Exercise 12 - strain/stress
load('strain.mat')
load('stress.mat')

g = @(x,s) hollmon_model(x,s);

x0 = [1;1];
options = optimoptions('lsqcurvefit','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
[xstar,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(g,x0,strain,stress,[],[],options);

PlotLSQ_Stress(xstar,stress,strain);