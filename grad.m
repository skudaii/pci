clc;
clear all;
x=-2:0.1:2;
y=x';
%mesh

%define scalar field
f=x.^2+y.^2; 

%Calculate x and y component of gradient
[fx,fy]= gradient(f,0,1);
x0=1;
y0=-2;
%find the defined point on the surface of scalar field
t= (x==x0) & (y==y0);
indt = find(t);
%return x and y component of gradient at specific point
f_grad = [fx(indt) fy(indt)]

contour(f);
hold on
quiver(fx,fy);
hold off
figure
surf(x,y,f)
xlabel('X-AXIS')
ylabel('Y-AXIS')
zlabel('Z-AXIS')


