function PlotLSQ_Braking_Distance(xstar, distance, velocity)

figure
plot(velocity, distance,'k.','LineWidth',2);
hold on

f = @(x, d) braking_distance_model(x,d);
temp_vel = linspace(0,45,1000);
temp_d = f(xstar,temp_vel);
plot(temp_vel, temp_d,'r-');

end