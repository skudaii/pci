% To calculate divergence and curl of a given vector 

clc;
clear all;
close all;

%finding divergence
[x,y,z]=meshgrid(-2:0.5:2); %defining rectangular grid with x,y,z
fx=y.*z; %vector along x direction
fy=4.*x.*y; %vector along y direction
fz=y; %vector along z direction
div=divergence(x,y,z,fx,fy,fz); %find divergence
figure(1)
figure('Name','divergence')
quiver3(x,y,z,fx,fy,fz) %plot x,y,z vectors
hold on
quiver3(x,y,z,div,div,div) %plot divergence
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
hold off

%finding curl
[cx,cy,cz]=curl(x,y,z,fx,fy,fz); %find curl
figure(2)
figure('Name','curl')
quiver3(x,y,z,fx,fy,fz) %plot vectors
hold on
quiver3(x,y,z,cx,cy,cz)%plot curl
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');




