% extract the person from the image

% Read the input image
img = imread('images/jump.jpg');
figure, subplot(3, 3, 1), imshow(img), title("Jump");


% Separate color channels
redChannel = img(:, :, 1);
greenChannel = img(:, :, 2);
blueChannel = img(:, :, 3);

% Compute blueness
blueness = double(blueChannel) - max(double(redChannel), double(greenChannel));

% Create a binary mask based on blueness threshold
binaryMask = blueness < 25;
subplot(3, 3, 2), imshow(binaryMask), title("Without blueness");


% Apply median filter to the binary mask
binaryMask = medfilt2(binaryMask, [3, 3]);
subplot(3, 3, 3), imshow(binaryMask), title("After median filter");


% Detect edges using Canny edge detector
edgesBW = edge(binaryMask, 'canny');
subplot(3, 3, 4), imshow(edgesBW), title("Edges");


% Dilate the edges for better connectivity
se = strel('square', 5);
edgesBW = imdilate(edgesBW, se);
subplot(3, 3, 5), imshow(edgesBW), title("Dilated Edges");


% Invert the binary mask
binaryMask = ~edgesBW;
subplot(3, 3, 6), imshow(binaryMask), title("Inverted Edges");


% Label connected components in the inverted binary mask
[L, num] = bwlabel(binaryMask);
RGB = label2rgb(L);
subplot(3, 3, 7), imshow(RGB), title("Connected Components");


% Extract and display regions of interest (ROIs) larger than a threshold
[height, width, ~] = size(img);
smallRatio = height * width * 0.002;

for i = 1:num
    currentRegion = uint8(L == i);
    regionSize = sum(currentRegion(:) == 1);

    % Skip small regions
    if regionSize < smallRatio
        continue;
    end

    % Extract and display the region of interest
    regionOfInterest = zeros(size(img));
    regionOfInterest(:, :, 1) = uint8(currentRegion) .* img(:, :, 1);
    regionOfInterest(:, :, 2) = uint8(currentRegion) .* img(:, :, 2);
    regionOfInterest(:, :, 3) = uint8(currentRegion) .* img(:, :, 3);
end

subplot(3, 3, [8, 9]), imshow(uint8(regionOfInterest)), title("Extracted Regions");