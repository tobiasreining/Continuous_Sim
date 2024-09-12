%A=10,rho=1.2,vx=300,vy=20,cd=1.5,m=100,g=9.81
%[a,b]=solveSym_2(A,rho,vx,vy,cd,m,g)
function [ax,ay] = solveSym_2(A,rho,vx,vy,cd,m,g)
syms a_x a_y
vy_abs = abs(vy);
v_abs=sqrt(vx^2+vy^2);
alpha = atan(vx/vy_abs);
f = -cos(alpha)*1/2*rho*A*cd*v_abs^2*sign(vy)-m*g;
h = -sin(alpha)*1/2*rho*A*cd*v_abs^2;
out=solve(f==m*a_y, h==m*a_x,[a_x,a_y], 'real', true);
ax=double(out.a_x);
ay=double(out.a_y);
end
