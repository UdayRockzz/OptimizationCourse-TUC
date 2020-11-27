clear all 

bec_pos = [ 8 6; -3 -3; 1 0; 8 -3];
bec_angle = [38; 220; 222; 300];


x0 = [1 1]; 

% f = @(x) pos_res_model_sum(x);
% 
% options = optimoptions('lsqnonlin','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
% [xstar,resnorm,residual,exitflag,output,lamxsabda,jacobian] = lsqnonlin(f,x0,[],[],options);

f = @(x) abs(pos_res_vec(x, bec_pos, bec_angle));

test_out = f(x0);

options = optimoptions('lsqnonlin','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
[xstar,resnorm,residual,exitflag,output,lambda,jacobian] = lsqnonlin(f,x0,[],[],options);


% load('var.mat')
% 
% tData = Zeit;
% Y0 = [1,0];
% m = 2;
% 
% ode = @(t,y) ode_rhs(t,y,m,r,k);
% [T,Y] = ode23(ode,tData,Y0);
% 
% options = optimoptions('lsqcurvefit','Algorithm','Levenberg-Marquardt','Diagnostics','on','Display','iter-detailed');
% [xstar,resnorm,residual,exitflag,output,lamxsabda,jacobian] = lsqcurvefit(ode23,Y0,Zeit,Position,[],[],options);

