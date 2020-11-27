clear all

towns = [1,1,5000; 2,7,3000; 4,5,1000; 6,8,4000; 9,7,2000];

d = [0;0];

% sum(sqrt((x-towns(:,1)).^2 + (y-towns(:,2)).^2) .* towns(:,3))

f = @(d) sum(sqrt((d(1)-towns(:,1)).^2 + (d(2)-towns(:,2)).^2) .* towns(:,3))

options = optimoptions('fminunc', ...
    'Algorithm', 'quasi-newton', ... 
    'Display', 'iter');

fminunc(f,d,options)