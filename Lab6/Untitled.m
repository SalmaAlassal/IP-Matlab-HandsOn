I = imread('c.png');
imshow(I);
[h, w, c] = size(I);
s = zeros(h, w, c);

for i = 1:h
    for j = 1:w
        %Red Car
        if I(i,j,1) > 150 && I(i,j,1) > (I(i,j,2)+80) && I(i,j,2) <= I(i,j,3) && I(i,j,3) < 120
            s(i, j, :) = I(i, j, :);
        end
        %orange car
        if I(i,j,1) > 65 && I(i,j,1) < 80 && I(i,j,2) > 200 && I(i,j,2) < 250 && I(i,j,3) > 50 && I(i,j,3) < 60
            s(i, j, :) = I(i, j, :);
        end
    end
end

subplot(1, 2, 1), imshow(I), title('Original Image');
subplot(1, 2, 2), imshow(uint8(s)), title('Extracted Red Car');