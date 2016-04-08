function fo = ink(input_path, output_path, deg)
    % input_path: Path of the source image 
    % output_path: Path of the output image
    % deg: Degree of ink intensity
    % fo: output Image variable, type: Array
    h = strel('disk', deg);
    s = fspecial('average');
    fi = imread(input_path);
    fo = imfilter(fi, s);
    fo = imerode(fo, h);
    imwrite(fo, output_path);
end