% Remove Periodic Noise

% Read the image
img = imread('./images/periodic-noise.png');

% Convert the image to double precision, scaling intensity values to the range [0, 1]
i_doubled = im2double(img);

% Compute the 2D Fourier Transform of the double-precision image
fourier = fft2(i_doubled);

% Shift the zero-frequency component of the Fourier transform to the center
% low frequencies at the center and high frequencies at the corners
fourier_shifted = fftshift(fourier);

% Create a binary mask
mask = ones(size(fourier_shifted));

% Paint specific regions in the mask black (set to 0) to exclude them from further processing
% This is done to remove or ignore periodic noise in these specific regions

% Exclude periodic noise pixels
% Y , X
mask(13:20, 119:124) = 0;
mask(40:46, 119:124) = 0;
mask(97:104, 119:124) = 0;
mask(216:225, 119:124) = 0;
mask(274:284, 119:124) = 0;
mask(297:305, 119:124) = 0;

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