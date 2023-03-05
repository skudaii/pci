clear;
close all
clc

% define variables. c0 is light speed,f is our freq, k=beta=, w=2pif
c0 = 3e8; % c0=10
f = 200e12;
lambda = c0/f;
k = 2*pi/lambda;
w = 2*pi*f;

% create the time step since in matlab we will plot step by step
Nt = 100;
dt = 1/f/50;

% create the vectors for x, y, and z. our wave is traveling in x direction.
% so we have taken x=0. we want to see just 4 waves. so 4 lamba. and in the
% other direction can take any number. i reduced number to 100 so that we
% get result faster. we dont need 1000.
x = linspace(0,4*lambda,100);
y = linspace(0,4*lambda,100);
z = linspace(0,4*lambda,100);

fig = figure;

for nt=1:Nt
  %Wipe the slate clean so we are plotting with a blank figure
  clf
    
  %fill(x,y,'r');
  
  % plot the data. when both waves are same we get linear polarization. e
  % field in y direction and h field in z. 
  plot3(x,cos(k*x-nt*dt*w),z,'LineWidth',3)
  hold on
  plot3(x,y,cos(k*x-nt*dt*w),'LineWidth',3)
  
  % set up the graph.first line is important,  rest is just
  % beautification. view means like from which angle you are watching the
  % wave. so if we watch from an angle other then front view, we will see 4
  % waves in 3d type view
  axis([0 4*lambda -2 2 -2 2]);
  xlabel('X');
  ylabel('Y');
  zlabel('Z');
  title('Linearly Polarized Electromagnetic Wave');
  %legend('Electric Field','Magnetic Field')
  grid on
  view([35 30])
end
