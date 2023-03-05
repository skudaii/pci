clc;
clear all;
close all;
%Magnetic field due to a straight current carrying wire (From Bio-Savart's law)
%Wire is placed along the x axis
Nx = 11; %No. of evaluation points
Nz = 11;
Ny = 11;
N= 50; %Defining the length of the wire
Xw = (floor(-N/2):floor(N/2)); %x coordinates of the wire
Yw = zeros(N+1,1); %y coordinates of the wire
Zw = zeros(N+1,1); %z coordinates of the wire
I = 3; %Current in the wire
u0 = 1; %Premittivity
xp(1:Nx)=-(Nx-1)/2:(Nx-1)/2; %x coordinates range for meshgrid
yp(1:Ny)=-(Ny-1)/2:(Ny-1)/2; %y coordinates range for meshgrid
zp(1:Nz)=-(Nz-1)/2:(Nz-1)/2; %z coordinates range for meshgrid
%Below arrays are for 1-D to 3-D conversions
X(1:Nx,1:Ny,1:Nz) = 0;
Y(1:Nx,1:Ny,1:Nz) = 0;
Z(1:Nx,1:Ny,1:Nz) = 0;
for i = 1:Nx
 X(i,:,:) = xp(i); %All x coordinates in 3D form
end
for i = 1:Ny
 Y(:,i,:) = yp(i); %All y coordinates in 3D form
end
for i = 1:Nz
 Z(:,:,i) = zp(i); %All z coordinates in 3D form
end
%Variable 'a' is along x, 'b' is along y and 'c' is along z
for a = 1:Nx
 for b = 1:Ny
for c = 1:Nz
 for i = 1:N-1
 Rx(i) = X(a,b,c)-(0.5*(Xw(i)+Xw(i+1)));
 Ry(i) = Y(a,b,c)-(0.5*(Yw(i)+Yw(i+1)));
 Rz(i) = Z(a,b,c)-(0.5*(Zw(i)+Zw(i+1)));
 
 dlx(i) = Xw(i+1) - Xw(i);
 dly(i) = Yw(i+1) - Yw(i);
 dlz(i) = Zw(i+1) - Zw(i);
 end
 
 Rx(N) = X(a,b,c)-(0.5*(Xw(N)+1));
 Ry(N) = Y(a,b,c)-(0.5*(Yw(N)+1));
 Rz(N) = Z(a,b,c)-(0.5*(Zw(N)+1));
 
 dlx(N) = -Xw(N)+1;
 dly(N) = -Yw(N)+1;
 dlz(N) = -Zw(N)+1;
 
 for i = 1:N
 Xcross(i) = (dly(i).*Rz(i)) - (dlz(i).*Ry(i));
 Ycross(i) = (dlz(i).*Rx(i)) - (dlx(i).*Rz(i));
 Zcross(i) = (dlx(i).*Ry(i)) - (dly(i).*Rx(i));
 R(i) = sqrt(Rx(i).^2+Ry(i).^2+Rz(i).^2);
 end
 
 Bx1 = (I*u0./(4*pi*(R.^3))).*Xcross;
 By1 = (I*u0./(4*pi*(R.^3))).*Ycross;
 Bz1 = (I*u0./(4*pi*(R.^3))).*Zcross;
 
 BX(a,b,c) = 0;
 BY(a,b,c) = 0;
 BZ(a,b,c) = 0;
 
 for i = 1:N
 BX(a,b,c) = BX(a,b,c)+Bx1(i);
 BY(a,b,c) = BY(a,b,c)+By1(i);
 BZ(a,b,c) = BZ(a,b,c)+Bz1(i);
 end
 
 end
 end
end
%----------------------------------------
figure(1)
quiver3(X,Y,Z,BX,BY,BZ,2);
hold on;
line([-5,5],[0,0],'linewidth',3,'color','r');
axis([-5 5 -5 5 -5 5]);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Magnetic flux density due to a current wire placed along x-axis');
h = gca;
set(h,'FontSize',14);
fh = figure(1);
set(fh,'color','white');
%----------------------------------------
figure(2)
quiver(Y((Nx-1)/2,:,:),Z((Nx-1)/2,:,:),BY((Nx-1)/2,:,:),BZ((Nx-1)/2,:,:),2);
hold on;
G1 = plot(0,0,'.','markersize',6);
set(G1,'MarkerEdgeColor','r');
axis([-5 5 -5 5]);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('B field on the YZ plane');
h = gca;
set(h,'FontSize',14);
fh = figure(2);
set(fh,'color','white');