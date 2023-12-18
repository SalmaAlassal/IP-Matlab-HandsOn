% Detect which light is ON in the traffic light

% Read the image
img = imread('images/traffic3.jpg');
figure, imshow(img);

% Get image dimensions
[height, width, channels] = size(img);

light = 0;
% Loop through the image pixels
for i = 1:height
    for j = 1:width
        % Check for red light
        if img(i, j, 1) > 140 && img(i, j, 2) < 20 && img(i, j, 3) < 20
            light = 1;
            break;
        end
        % Check for green light
        if img(i, j, 1) < 200 && img(i, j, 2) > 200 && img(i, j, 3) < 20
            light = 2;
            break;
        end
        % Check for yellow light
        if img(i, j, 1) > 200 && img(i, j, 2) > 150 && img(i, j, 3) < 20
            light = 3;
            break;
        end
    end
    % Break the outer loop if a light is detected
    if light > 0
        break;
    end
end

% Display the detected light
if light == 1
    disp('Red is ON');
elseif light == 2
    disp('Green is ON');
elseif light == 3
    disp('Yellow is ON');
else
    disp('No valid light detected');
end