clc; %clear the command Line
clear; %remove all previous variable

epsilon=8.85e-12; %use permittivity of air
rho=12e-3; %the surface charge density
P=[0,0,10]; %the Position of the observation point
E=zeros (1,3); %initialize E=(0,0,0)

Number_of_x_Steps=100; %initialize discretization in the x direction
Number_of_y_Steps=100; %initialize discretization in the y direction

x_lower=-2;%the lower boundary of x
x_upper=2;%the upper boundary of x
y_lower=-2;%the lower boundary of y
y_upper=2;%the upper boundary of y

dx=(x_upper-x_lower) /Number_of_x_Steps; %the x increment
dy=(y_upper-y_lower) /Number_of_y_Steps; %the y increment
ds=dx*dy; %the area of single grid
dQ=rho*ds; %the charge on a single grid m

 
for j=1:Number_of_y_Steps
	for i=1:Number_of_x_Steps
	x=x_lower +dx/2+(i-1)*dx; %the x component of the centre of a grid
	y=y_lower +dy/2+(j-1)*dy; %the y component of the centre of a grid
	R=P-[x y 0]; %vector R is the vector seen from the centre of the grid to the observation point
	Rmag=norm(R); %magnitude of vector R
	E=E+ (dQ*abs (y) / (4*epsilon*pi*Rmag^3))*R;% get contribution to the E field
end
end

OUTPUT :

dQ =

   1.9200e-05

E

E =

   1.0e+07 *

   -0.0000   -0.0000    1.6444
