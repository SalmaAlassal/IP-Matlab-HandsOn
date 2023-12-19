% Extracting the greyscale image from a color image
img = imread('Jaguar.bmp');
grayImg = rgb2gray(img);
figure, imshow(grayImg);

% Make the image darker/lighter
img = imread('Jaguar.bmp');
darkImg = img - 50;
lightImg = img + 50;
figure;
subplot(1, 3, 1), imshow(img), title('Original Image');
subplot(1, 3, 2), imshow(darkImg), title('Dark Image');
subplot(1, 3, 3), imshow(lightImg), title('Light Image');

% Extracting the Red, Green and Blue histograms of an image
img = imread('Jaguar.bmp');
figure;
subplot(2, 2, 1), imshow(img), title('Original Image');
subplot(2, 2, 2), imhist(img(:,:,1)), title('Red Histogram');
subplot(2, 2, 3), imhist(img(:,:,2)), title('Green Histogram');
subplot(2, 2, 4), imhist(img(:,:,3)), title('Blue Histogram');

% Extracting the Red, Green and Blue channels of an image
img = imread('jaguar.bmp');
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
figure;
subplot(2, 2, 1), imshow(img), title('Original Image');
subplot(2, 2, 2), imshow(red), title('Red Channel');
subplot(2, 2, 3), imshow(green), title('Green Channel');
subplot(2, 2, 4), imshow(blue), title('Blue Channel');