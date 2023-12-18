
% Remove Periodic Noise

% Read the image
img = imread('images\face2descreen.jpg');

% Convert the image to double precision, scaling intensity values to the range [0, 1]
i_doubled = im2double(img);

% Compute the 2D Fourier Transform of the double-precision image
fourier = fft2(i_doubled);

% Shift the zero-frequency component of the Fourier transform to the center
% low frequencies at the center and high frequencies at the corners
fourier_shifted = fftshift(fourier);

% Create a binary mask
mask = ones(size(fourier_shifted));

% Exclude periodic noise pixels
% Y , X
mask(293:299, 393:399) = 0;
mask(478:484, 393:399) = 0;

mask(339:345, 303:310) = 0;
mask(433:439, 303:310) = 0;

mask(335:341, 483:489) = 0;
mask(429:435, 483:489) = 0;


% Element-wise multiplication
multipliedFourier = fourier_shifted .* mask;

% Inverse shift the multiplied Fourier transform
inverse_fourier_shifted = ifftshift(multipliedFourier);

% Compute the inverse Fourier Transform to obtain the final filtered image
inverse_fourier = ifft2(inverse_fourier_shifted);

% Display the original image, Fourier-transformed image, mask, and final filtered image
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(log(abs(fourier_shifted)), []), title('Fourier Shifted');
subplot(2, 3, 3),imshow(log(abs(multipliedFourier)),[]),title('Power Spectrum');
subplot(2, 3, 4), imshow(mask), title('Mask');
subplot(2, 3, 5), imshow(inverse_fourier), title('Final Image');