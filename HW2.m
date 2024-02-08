% Homework 2
% Yi Shen; U93947170; Feb 27, 2024

% 3
clear
close all
clc
%% (a)
x = 1:32;
y = 1:32;
[X,Y] = meshgrid(x,y);

u1 = zeros(size(X));
u2 = zeros(size(X));
u1(abs(X-17)<=5 & abs(Y-17)<=5) = 1;
u2(abs(X-17)+abs(Y-17)<=7) = 1;

figure
subplot(3,2,1)
stem3(u1);
title("u_1 ")
%imshow(u1,[])
subplot(3,2,2)
stem3(u2);
%imshow(u2,[])
title("u_2 ")

%% (b)

U1 = fftshift(fft2(ifftshift(u1)));
U2 = fftshift(fft2(ifftshift(u2)));


subplot(3,2,3)
surf(real(U1))
xlim([0,33])
ylim([0,33])
zlim([-10,120])
title("DFT of u_1 ")
x_ticks = linspace(1, 32, 5);
y_ticks = linspace(1, 32, 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
yticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
subplot(3,2,4)
surf(real(U2))
xlim([0,33])
ylim([0,33])
zlim([-10,120])
title("DFT of u_2 ")
x_ticks = linspace(1, 32, 5);
y_ticks = linspace(1, 32, 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
yticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});


%% (c)
fx = -1/2:1/32:15/32;
fy = -1/2:1/32:15/32;
[FX,FY] = meshgrid(fx,fy);
CU1 = 100*sinc(10*FX).*sinc(10*FY);
CU2 = 98*sinc(7*(FX-FY)).*sinc(7*(FX+FY));
subplot(3,2,5)
surf(real(CU1))
xlim([0,33])
ylim([0,33])
zlim([-10,120])
title("analytic CSFT of u_1 ")
x_ticks = linspace(1, 32, 5);
y_ticks = linspace(1, 32, 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
yticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
subplot(3,2,6)
surf(real(CU2))
xlim([0,33])
ylim([0,33])
zlim([-10,120])
title("analytic CSFT of u_2 ")
x_ticks = linspace(1, 32, 5);
y_ticks = linspace(1, 32, 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});
yticklabels({'- \pi ', '- \pi /2', '0', '\pi /2', ' \pi '});

figure
subplot(2,2,1)
plot(U1(:,15))
subplot(2,2,2)
plot(U1(:,16))
subplot(2,2,3)
plot(U1(:,17))
subplot(2,2,4)
plot(U1(:,18))




figure
subplot(1,2,1)
plot(U2(:,16))
subplot(1,2,2)
plot(CU2(:,16))

