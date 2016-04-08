function fo = sharpen(input_path, output_path)
% input_path: Path of the source image
% output_path: Path of the output image
% fo: output Image variable, type: Array
fi = imread(input_path);
h = fspecial('unsharp');
fo = imfilter(fi,h);
imwrite(fo, output_path);
end

