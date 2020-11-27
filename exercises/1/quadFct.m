function f = quadFct( x )
B=[2,0;0,1];
% B=[-2,0;0,-1];
% B=[2,0;0,-1];
g=[-4;-2];
c=6;
f = 0.5 * x'*B*x + g'*x + c;
end

