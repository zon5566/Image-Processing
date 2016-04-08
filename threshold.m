function fo = threshold(input_path, output_path)
fi = imread(input_path);

thresh_value = multithresh(fi, 7)

value = [0 thresh_value(2:end) 255]
quantRGB = imquantize(fi, thresh_value, value);
fo = quantRGB;
imwrite(fo, output_path);
end

