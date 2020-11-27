clear all
% Nachfrage / demand
d = [180;200;260;320;420;480;780;800;780;420;360;780];
% Anzahl Zeitintervale / number of time intervals

% Produktionsleistung pro Arbeiter / production per worker

% Ungleichungen / inequalities


% Gleichungen / equalities


% untere und obere Grenzen / lower and upper bounds



% Kosten / costs




options = optimoptions('linprog','Algorithm','dual-simplex','display','off');

[x,fval,exitflag,output,lambda] = ...
linprog(c,Aineq,bineq,Aeq,beq,low,up,[],options);
if (exitflag ~=1)
    exitflag
end

Gesamtkosten = fval
Produktion = round( x(1:n)')
Lager = round( x((n+1):(2*n))' )
Arbeiter_temp = round( x((2*n+1):(3*n))' )
Arbeiter_fest = round( x(3*n+1) )

% Balkendiagramm / bar diagram
figure(1);clf
axis([0 13 0 1200])
xlabel('Monat');
ylabel('Mengeneinheiten');
hold on
% Nachfrage / demand
bar1=bar(d, 'FaceColor', [0.8 0.8 0.8],'BarWidth',1); 
% Produktion + Lager / production plus storage
bar2=bar(Produktion+[0,Lager(1:11)], 'FaceColor', 'b','BarWidth',0.6); 
% Produktion / production
bar3=bar(Produktion, 'FaceColor', 'g','BarWidth',0.6); 
legend('Nachfrage','aus dem Lager','Produktion','Location','NorthWest')
plot([0,14],pf*x(3*n+1)*[1,1],'-r')

