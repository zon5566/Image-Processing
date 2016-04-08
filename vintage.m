function fo = vintage(input_path, output_path, deg)
% input_path: Path of the source image
% output_path: Path of the output image
% deg: degree of vintage
fi = imread(input_path);

fi_r = fi(:,:,1);
fi_g = fi(:,:,2);
fi_b = fi(:,:,3);

fi_r = (fi_r*0.393) + (fi_g*0.769) + (fi_b*0.189);
fi_g = (fi_r*0.349) + (fi_g*0.686) + (fi_b*0.168);
fi_b = (fi_r*0.272) + (fi_g*0.534) + (fi_b*0.131);

fo = cat(3, fi_r, fi_g, fi_b);
fo = imadjust(fo, [],[], deg);
imwrite(fo, output_path);
end