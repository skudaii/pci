clear all;
close all;
clc;
m = 11; %Range of the meshgrid
xg = linspace(-5,5,m); %range of x coordinates
yg = linspace(-5,5,m); %range of y coordinates
[x,y] = meshgrid(xg,yg); %Create mesh
Ex = zeros(m,m); %Initialize x component to zero
Ey = zeros(m,m); %Initialize y component to zero
V = zeros(m,m); %Initialize potential to zero
x_1 = [-5,5]; % x coordinates of charges
y_1 = [0,0]; %y coordinates of charges
q = [10e-6,-10e-6]; %Magnitude of charge
esp = 9e9; %Constant
for i=1:2
 Rx = x - x_1(i); %x component of position vector
 Ry = y - y_1(i); %y component of position vector
 R = sqrt((Rx.^2)+(Ry.^2)); %Position vector
 V = V+q(i).*esp./R %potential
end
surf(V);
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
title('Scalar Potential due to an Electric Dipole');