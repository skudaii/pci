clear;
close all
clc

% define variables
c0 = 3e8;
f = 200e12;
lambda = c0/f;
k = 2*pi/lambda;
w = 2*pi*f;

% create the time step
Nt = 100;
dt = 1/f/50;

% create the vectors for x, y, and z
x = linspace(0,4*lambda,100);
y = linspace(0,4*lambda,100);
z = linspace(0,4*lambda,100);

fig = figure;

for nt=1:Nt
  %Wipe the slate clean so we are plotting with a blank figure
  clf
  
  % plot the data. for circular polarizartion e nd h are just 90 degree out
  % of phase but magnitude is same.
  hold on
  plot3(x,cos(k*x-nt*dt*w),z,'b-','LineWidth',3);
  plot3(x,y,sin(k*x-nt*dt*w),'b-','LineWidth',3);
  plot3(x,cos(k*x-nt*dt*w),sin(k*x-nt*dt*w),'r','LineWidth',1.5);
  
  % set up the graph. if you want front view change view to [90 0]
  axis([0 4*lambda -2 2 -2 2]);
  xlabel('X');
  ylabel('Y');
  zlabel('Z');
  title('Circular Polarization');
  set(gca,'box','on')
  grid on
  view([35 30])
  
 
end
  