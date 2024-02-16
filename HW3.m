%% HW3
clear
close all
clc
%% 1
% Given sampling matrix for Λ
V_Lambda = [1, 1/3; 0, 1];

% Calculate determinant of Λ
d_Lambda = det(V_Lambda);

% Compute the sampling matrix of the reciprocal lattice Λ*
V_Lambda_star = inv(V_Lambda)';

% Calculate determinant of Λ*
d_Lambda_star = det(V_Lambda_star);

% Display the results
d_Lambda
V_Lambda_star
d_Lambda_star





%% (b)
F1 = linspace(-1,31/32,64);
F2 = linspace(-1,31/32,64);
h = [1,1,1,1,1,1,1,;
    1,2,2,2,2,2,1;
    1,2,3,3,3,2,1;
    1,2,3,4,3,2,1;
    1,2,3,3,3,2,1;
    1,2,2,2,2,2,1;
    1,1,1,1,1,1,1]/84;
[H,f1,f2] = freqz2(h,F1,F2);


figure
subplot(3,2,1)
stem3(h)
title('2-D Unit Impulse Response');

subplot(3,2,2)
contour(f1, f1, abs(real(H)))
axis image
title('2-D Magnitude Response (Contour)')

subplot(3,2,3)
surf(f1, f1, abs(real(H)),'EdgeColor','none')
title('2-D Magnitude Response (Surface)');

subplot(3,2,4)
plot(f1, H(:,f2==0))
title('1-D Magnitude Response for f_y =0');

subplot(3,2,5)
%imshow(angle(H),[])
surf(f1, f1, angle(abs(H)))
title('2-D Phase Response (Surface)');

subplot(3,2,6)
plot(f1, angle(H(:,f2==0)))
title('1-D Phase Response for f_y =0');

%% (d)
g = [0,0,0,0,0,0,0;
    0,0,0,0,0,0,0;
    0,0,0,0,0,0,0;
    0,0,0,1,0,0,0;
    0,0,0,0,0,0,0;
    0,0,0,0,0,0,0;
    0,0,0,0,0,0,0]- [1,1,1,1,1,1,1;
    1,2,2,2,2,2,1;
    1,2,3,3,3,2,1;
    1,2,3,4,3,2,1;
    1,2,3,3,3,2,1;
    1,2,2,2,2,2,1;
    1,1,1,1,1,1,1]/84;


[G, f1, f2] = freqz2(g);
figure
subplot(3,2,1)
stem3(g)
title('2-D Unit Impulse Response');

subplot(3,2,2)
contour(f1, f1, abs(real(G)))
axis image
title('2-D Magnitude Response (Contour)')

subplot(3,2,3)
surf(f1, f1, abs(real(G)),'EdgeColor','none')
title('2-D Magnitude Response (Surface)');

subplot(3,2,4)
plot(f1, G(:,f2==0))
title('1-D Magnitude Response for f_y =0');

subplot(3,2,5)
surf(f1, f1, angle(G))
title('2-D Phase Response (Surface)');

subplot(3,2,6)
plot(f1, angle(G(:,f2==0)))
title('1-D Phase Response for f_y =0');

%% (e)
barbara = imread('barbara.tif');
bh = filter2(h, barbara);
bg = filter2(g, barbara);
figure
subplot(1,3,1)
imshow(barbara,[])
title('Raw Image');
subplot(1,3,2)
imshow(bh,[])
title('Image with filter "h"');
subplot(1,3,3)
imshow(bg,[])
title('Image with filter "g"');




%%
bh_same = filter2(h, barbara,"same");
bg_same = filter2(g, barbara,"same");
bh_full = filter2(h, barbara,"full");
bg_full = filter2(g, barbara,"full");
bh_valid = filter2(h, barbara,"valid");
bg_valid = filter2(g, barbara,"valid");

figure
subplot(3,2,1)
imshow(bh_same,[])
subplot(3,2,2)
imshow(bg_same,[])
subplot(3,2,3)
imshow(bh_full,[])
subplot(3,2,4)
imshow(bg_full,[])
subplot(3,2,5)
imshow(bh_valid,[])
subplot(3,2,6)
imshow(bg_valid,[])






















