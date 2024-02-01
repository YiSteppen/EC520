clear
close all
clc

%% (1)
A = 5;
f1 = 3.5;
f2 = 2.5;
phi = 0;
x1 = linspace(0,1,256);
x2 = linspace(0,1,256);
[X1, X2] = meshgrid(x1, x2);
U = A*cos(2*pi*(f1*x1+f2*X2)+phi);
figure
subplot(2,2,1)
imshow(U)
axis on
title('u(x)=5cos[2 \pi (3.5 x_1 +2.5 x_2 )]')
xlabel('x_1')
ylabel('x_2')


%% (2)

subplot(2,2,2)
imshow(U)
axis on
axis xy
title('u(x) in Cartesian coordinate')
xlabel('x_1')
ylabel('x_2')



%% (3)
subplot(2,2,3)
imshow(U)
x_ticks = linspace(0, size(U, 2), 5);
y_ticks = linspace(1, size(U, 1), 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
yticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
axis on
title('u(x) with 0-1 tickes range')
xlabel('x_1')
ylabel('x_2')
subplot(2,2,4)
imshow(U)
x_ticks = linspace(0, size(U, 2), 5);
y_ticks = linspace(1, size(U, 1), 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
yticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
axis on
axis xy
title('u(x) in Cartesian coordinate with 0-1 tickes range')
xlabel('x_1')
ylabel('x_2')



%% (4)
figure
imshow(U,[min(min(U)), max(max(U))])
x_ticks = linspace(0, size(U, 2), 5);
y_ticks = linspace(1, size(U, 1), 5);
xticks(x_ticks);
yticks(y_ticks);
xticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
yticklabels({'0.0', '0.25', '0.5', '0.75', '1.0'});
axis on
axis xy
colorbar
disp('The minimum value of U is')
disp(min(min(U)));
disp('The maximum value of U is')
disp(max(max(U)));
title('u(x) with range of values (-5,5)')
xlabel('x_1')
ylabel('x_2')


%% (5)
U_dig = zeros(256,1);
for i = 1:256
    U_dig(i) = U(i,i);
end
figure
subplot(3,1,1)
plot(x1,U(1,:))
title('Horizontal u( x_1 ,0)')
xlabel('x')
ylabel('y')
subplot(3,1,2)
plot(x2,U(:,1))
title('uVertical u(0, x_2 )')
xlabel('x')
ylabel('y')
subplot(3,1,3)
plot(x1,U_dig)
title('Diagonal u( x_1, x_1 )')
xlabel('x')
ylabel('y')



















