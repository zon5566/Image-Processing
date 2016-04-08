function fo = sketch(input_path, output_path)
% 1. Desaturate
% 2. imcomplement
% 3. gaussian 
% 4. fade color
% input_path: Path of source image
% output_path: Path of output image
% fo: output Image variable, type: Array
fi = imread(input_path);
im_size = size(fi);
height = im_size(1);
width = im_size(2);

f_gray = rgb2gray(fi); %1.
f_imc = imcomplement(f_gray); %2.
h = fspecial('gaussian', [5 5], 3);
f_gaus = imfilter(f_imc, h); %3.

for i=1:height
    for j=1:width
        b = double(f_gaus(i,j));
        a = double(f_gray(i,j));
        tmp = a+a*b/(256-b);
        fo(i,j) = uint8(min(tmp,255));
    end
end
fo = imadjust(fo, [], [], 2);
imwrite(fo, output_path);
end
