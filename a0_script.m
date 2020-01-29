%Input images
close all;
set(gcf,'Position',[0,0,1200,600]);
%(a)
figure(1);
subplot(2,3,1);
snoopy = imread('snoop.png');
imshow(snoopy);
title('1(a) Image 1');

subplot(2,3,2);
pikachu = imread('pikachu.png');
imshow(pikachu);
title('1(a) Image 2');

%Colour planes
%(a)
img = snoopy; %loads original
img2 = pikachu;
redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3); 


%(b)
swappedChannels = cat(3, blueChannel, redChannel, greenChannel);
subplot(2,3,3);
imshow(swappedChannels);
title('2(b) Red and Blue Channel Swap');

%(c)
%just show one of the channels for a monochrome image
subplot(2,3,4);
img_g = greenChannel;
imshow(img_g);
title('2(c) Monochrome with G');

%(d)
subplot(2,3,5);
img_r = redChannel;
imshow(img_r);
title('2(d) Monochrome with R');

%(e)
subplot(2,3,6);
gray_img = rgb2gray(img);
imshow(gray_img);
title('2(e) Monochrome using rgb2gray()');

%Replacememnt of pixels
%3(a)
figure(2);
set(gcf,'Position',[0,0,1200,600]);
subplot(2,3,1);
gray_img2 = rgb2gray(img2);
croppedImage = gray_img(206:306, 206:306);
%paste cropped image 1 to image 2
gray_img2(206:306, 206:306) = croppedImage;
imshow(gray_img2);
title('3(a)');

%Arithmetic and geometric pixels
%4(a)
Y = single(img_g);
maxPixel = max(max(Y)); %finds the max value of the pixel
minPixel = min(min(Y)); %finds the min value of the pixel
meanPixel = mean(mean(Y)); %finds the mean
stdDev = std(std(Y)); %finds std dev
disp(maxPixel);
disp(stdDev);

%4(b)
X = meanPixel + (10*((Y - meanPixel)/stdDev));
X = uint8(X);
subplot(2,3,2);
imshow(X);
title('4(b)');

%4(c) Shift img_g to the left by 2 pixels
Z = circshift(img_g, -2, 2);
subplot(2,3,3);
imshow(Z);
title('4(c)');

%4(d)
A = single(img_g); %converting image to a single type
Z = single(Z);
B = A - Z;
B = uint8(B);
subplot(2,3,4);
imshow(B);
title('4(d)');

%4(e)
C = flip(img_g, 2);
subplot(2,3,5);
imshow(C);
title('4(e)');

%4(f)
D = 255 - img_g;
subplot(2,3,6);
imshow(D);
title('4(f)');

%Image noise
%5(a)
E = img;
std_dev = 30;

channelR = double(redChannel) + randn(512,512)*std_dev;
channelG = double(greenChannel) + randn(512,512)*std_dev;
channelB = double(blueChannel) + randn(512,512)*std_dev;
gaussian_image = uint8(cat(3, channelR, channelG, channelB));
figure(3);
imshow(gaussian_image);
title('5(a) Image noise');







