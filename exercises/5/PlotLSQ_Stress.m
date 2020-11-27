function PlotLSQ_Braking_Distance(xstar, distance, velocity)

figure
plot(velocity, distance,'k.','LineWidth',2);
hold on

f = @(x, s) hollmon_model(x,s);
temp_vel = linspace(0,1,1000);
temp_d = f(xstar,temp_vel);
plot(temp_vel, temp_d,'r-');

end