I = imread("cameraman.tif");
hpf = [-1 -1 -1; -1 9 -1; -1 -1 -1];
[r, c] = size(I);
[m, n] = size(hpf);
h = rot90(hpf, 2);
center = floor((size(h)+1)/2);
left = center(2) - 1;
right = n - center(2);
top = center(1) - 1;
buttom = m - center(1);
Rep = zeros(r + top + buttom, c + left + right);
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep(x,y) = I(x - top, y - left);
    end
end
B = zeros(r, c);
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 :n
                q = x - 1;
                w = y - 1;
                B(x,y) = B(x,y) + (Rep(i + q, j + w) * h(i, j));
            end
        end
    end
end

subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(uint8(B));