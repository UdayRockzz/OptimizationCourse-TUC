clear all
% Daten einlesen / load data
data_internship;

% Bewerber / candidates


% Anzahl Studenten / number of candidates


% Kanten erstellen, Sortierung: zuerst die Erstwuensche, dann Zweitw.,...
% build edges, sorting: begin with first wishes, than second wishes,...


% Gleichungen / equalities


% untere und obere Schranken / lower and upper bounds


% kostenvektoren / cost vector


options = optimoptions('linprog','Algorithm','dual-simplex','display','iter');
% Aufruf des Simplex-Verf. / call simplex method
[x,fval,exitflag,output,lambda] = linprog(c,Ain,b,[],[],low,upp,[],options);

% Loesung ausgeben / present solution
for i=1:(3*s)
    if x(i)==1
        disp(['Candidate ',num2str(E(i,1)),' is assigned to company ',num2str(E(i,2)-s),'.']);
    end
end
