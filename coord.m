%Conversion of vector from spherical to cartesian co-ordinate system
B=[-3,4,0]; %given point
x=B(1);
y=B(2);
z=B(3);

%converting to point to spherical co-ordinate system
r=sqrt(x^2+y^2+z^2); 
theta=atan2d((sqrt(x^2+y^2)),z);
phi=atan2d(y,x);

%vector that is to be convertion from spherical to cartesian sytem
B_r=10/r;
B_theta= r*cosd(theta);
B_phi=1;

%converting the vector into cartesian
B_cart = [sind(theta)*cosd(phi) cosd(theta)*cosd(phi) -sind(phi); sind(theta)*sind(pi) cosd(theta)*sind(phi) cosd(phi); cosd(theta) -sind(theta) 0]*[B_r;B_theta;B_phi];
Bx=B_cart(1);
By=B_cart(2);
Bz=B_cart(3);

%conversion of vector from spherical to sylindrical system
B=[5,pi/2,-2];
rho=B(1);
phi=B(2);
Z=B(3);

%converting the point in spherical system
r=sqrt(rho^2+Z^2);
theta=atan2d(rho,z);

%Vector that is to be converted from spherical to cylindrical co-ordinate
B_r=10/r;
B_theta=r*cosd(theta);
B_phi=1;

%converting the vector into cylindrical system
B_pol=[sin(theta) cosd(theta) 0;0 0 1;cosd(theta) -sind(theta) 0] *[B_r;B_theta;B_phi];
b_rho=B_pol(1);
B_phi=B_pol(2);
B_z=B_pol(3);





