% verification of Gauss's Law--%
Q=1e-6; % charge value
c=[0 0 0]; %position of charge
az=[0 0 1]; % unit vector along z
x1=-1;
x2=1; %end point of plane along x axis
y1=-1;
y2=1; %end point of plane along y axis

%in order to discretize plane divide the plane into 500 points as
%follows---%

X=500;
Y=500;
dx=(x2-x1)/X;
dy=(y2-y1)/Y;

%initialize flux to zero
flux=0;
for j=1:Y
    for i=1:X
        ds=dx*dy; %incremental surface area
        x=x1+0.5*dx+(i-1)*dx; % x coordinate of mid point
        y=y1+0.5*dy+(j-1)*dy; % y coordinate of mid point
        P=[x y 1];
        R=P-c; %vector from mid point of surface to charge
        RMag=norm(R);
        RUnit=R/RMag; %unit vector along direction of flux
        Rsurface=az;
        flux=flux+Q*ds*dot(Rsurface,RUnit)/(4*pi*RMag^2); %calculating total
        %flux through the plane %
    end
end
flux=flux*6; %total flux through the volume







