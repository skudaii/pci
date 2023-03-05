clc;
clear;

Nz = 51;%no of grids on z axis
Ny = 51;%no of grids on y axis
N = 25; %no of grids in the coil
Ra = 6; %coil radius
I = 3; %coil current
u0 = 1; %free space hence 1
phi = -pi/2:2*pi/(N-1):3*pi/2;%describe coil as a circle

Xc = Ra*cos(phi); %x coordinate of coil
Yc = Ra*sin(phi); % y coordinate of coil

yp(1:51)=-25:1:25; %y coordinates of the plane
zp(1:51)=0:1:50; % z coordinates of the plane

Y(1:Ny,1:Nz)=0; %convert from 1d to 2d
Z(1:Ny,1:Nz)=0;

for i =1:Ny
    Y(i,:)=yp(i);
end
for i =1:Nz
    Z(:,i)=zp(i);
end

for a=1:Ny
    for b=1:Nz
        for i=1:N-1
            Rx(i)=-0.5*(Xc(i)+Xc(i+1));
            Ry(i)=(Y(a,b) - (0.5*(Yc(i) + Yc(i+1))));
            Rz(i)=Z(a,b);
            dlx(i)=Xc(i+1)-Xc(i);
            dly(i)=Yc(i+1)-Yc(i);
        end
        Rx(N)=-0.5*(Xc(N) + Xc(1));
        Ry(N)=(Y(a,b)-(0.5* (Yc(N) + Yc(1))));
        Rz(N)= Z(a,b);
        dlx(N)=-Xc(N) + Xc(1);
        dly(N)=-Yc(N) + Yc(1);
        for i=1:N
            Xcross(i)=dly(i) .*Rz(i); 
            Ycross(i)=-dlx(i) .*Rz(i) ;
            Zcross(i)=(dlx(i) .*Ry(i)) - (dly (i) .*Rx (i));
            R(i)=sqrt(Rx(i) .^2+Ry(i) .^2+Rz(i).^2);
        end
        Bxl=(I*u0./(4*pi* (R.^3))) .*Xcross;
        Byl=(I*u0./(4*pi* (R.^3))) .*Ycross;
        Bzl=(I*u0./(4*pi* (R.^3))) .*Zcross;
        BX(a,b) = 0;
        BY(a,b) = 0;
        BZ(a,b) = 0;
        for i = 1:N
            BX(a,b) = BX(a,b) + Bxl(i);
            BY(a,b) = BY(a,b) + Byl(i);
            BZ(a,b) = BZ(a,b) + Bzl(i);
        end
    end
end

figure(1)
plot(Xc,Yc,'linewidth',3)
axis([-20 20 -20 20])
xlabel('X-axis', 'fontsize', 14)
ylabel('Y-axis', 'fontsize', 14)
title('circular loop co-ordinates','fontsize',14)
h=gca;
get(h,'FontSize')
set(h,'FontSize',14)
h = get(gca,'ylabel');
fh = figure(1);
set(fh,'color','white');
grid on

figure(2)
lim1=min(min(BZ));
lim2=max(max(BZ));
steps=(lim2-lim1)/100;
contour(zp,yp,BZ,lim1:steps:lim2)
axis([1 50 -25 25])
xlabel('Z-axis','fontsize',14)
ylabel('Y-axis', 'fontsize', 14)
title('BZ component','fontsize',14)
colorbar('location','eastoutside','fontsize',14);
h=gca;
get(h,'FontSize')
set(h,'FontSize',14)
h = get(gca,'ylabel');
fh = figure(2);
set(fh, 'color', 'white');

figure(3)
lim1=min(min(BY));
lim2=max(max(BY));
steps=(lim2-lim1)/100;
contour(zp,yp,BY,lim1:steps:lim2)
axis([1 50 -25 25])
xlabel('Z-axis','fontsize',14)
ylabel('Y-axis', 'fontsize', 14)
title('BY component','fontsize',14)
colorbar('location','eastoutside','fontsize',14);
h=gca;
get(h,'FontSize')
set(h,'FontSize',14)
h = get(gca,'ylabel');
fh = figure(3);
set(fh, 'color', 'white');

figure(4)
quiver(zp,yp,BZ,BY,2)
axis([1 50 -25 25])
xlabel('Z-axis','fontsize',14)
ylabel('Y-axis', 'fontsize', 14)
title('B-field vector flow','fontsize',14)
h=gca;
get(h,'FontSize')
set(h,'FontSize',14)
h = get(gca,'ylabel');
fh = figure(4);
set(fh, 'color', 'white');


