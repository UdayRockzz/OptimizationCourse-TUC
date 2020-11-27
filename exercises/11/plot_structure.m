function [] = plot_tragwerk( pos, E, x, lager, b)
% Zeichnet den Graph mit...
%  pos   - Knotenpositionen
%  E     - Kantenmenge mit Start- und Endknoten
%  x     - Dicke der Kanten
%  lager - gelagerte Knoten
%  b     - angreifende Kraefte

TOL = 1e-4; n = size(E,1);
% x normalisieren
x = 4*x/abs(max(x));

xmin = min(pos(:,1)); xmax = max(pos(:,1)); 
ymin = min(pos(:,2)); ymax = max(pos(:,2)); 

figure(1);clf % neues Bild
d=0.1; axis([ xmin-d xmax+d ymin-d ymax+d ]); % Fenster anpassen
hold on

% Kanten zeichnen
for e=1:n
    if (x(e)>TOL) % Zugbelastung ist gross genug
        X = pos([E(e,1),E(e,2)],1); % Knotenpositionen
        Y = pos([E(e,1),E(e,2)],2); 
        plot(X,Y,'-b','LineWidth',x(e)); % blaue Kante einzeichnen
    end
    if (-x(e)>TOL) % Druckbelastung (negativ) ist gross genug
        X = pos([E(e,1),E(e,2)],1); % Knotenpositionen
        Y = pos([E(e,1),E(e,2)],2); 
        plot(X,Y,'-r','LineWidth',-x(e)); % rote Kante einzeichnen
    end
end

% Kraefte einzeichnen
m = length(b)/2;
for i=1:m
    if (( b(i)~=0) | (b(m+i)~=0) ) % nur einzeichnen, wenn b ungleich 0
       quiver(pos(i,1),pos(i,2), b(i),b(m+i),'k', 'LineWidth', 2) % Pfeil
    end
end

% Lager einzeichnen
for i=1:length(lager)
    l = lager(i);
    if (l<=m) 
        plot(pos(l,1)-0.01*(xmax-xmin),pos(l,2),'k>','Markersize',10)
    else
        plot(pos(l-m,1),pos(l-m,2)-0.04*(ymax-ymin),'k^','Markersize',10)
    end
end

% moegliche Knoten einzeichnen
for i=1:m
    %plot(pos(i,1),pos(i,2),'kx')
end


