% Hand Sign Detection

% Read the input image
img = imread('images/hand1.jpg');

% Convert the image to grayscale
grayImg = rgb2gray(img);

% Binarize the grayscale image with a high threshold
binaryImg = im2bw(grayImg, 0.9);
binaryImg = ~binaryImg;  % Invert the binary image

% Get image dimensions and crop the upper quarter
[h, w, c] = size(img);
newH = h / 4;
cropped = imcrop(binaryImg, [0 0 w newH]);

% Dilation to eliminate noise and combine adjacent white pixels
dilation = imdilate(cropped, ones(3, 3));

% Label connected components in the dilated image
[L, num] = bwlabel(dilation);

% Display original, grayscale, binary, and cropped images
subplot(2, 2, 1), imshow(img), title('Original Image');
subplot(2, 2, 2), imshow(grayImg), title('Gray Scale');
subplot(2, 2, 3), imshow(binaryImg), title('Threshold + Inverted');
subplot(2, 2, 4), imshow(cropped), title('Cropped Image');

% Display the number of connected components (potential hand signs)
disp(['Number of hand signs: ', num2str(num)]);
