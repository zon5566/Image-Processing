function fo = oil_paint(input_path, output_path)
fi = imread(input_path);

m = 11; n = 11;
Image = uint8(zeros(size(fi,1)-m, size(fi,2)-n, 3));
for v =1:3
for i=1:size(fi,1)-m
    for j=1:size(fi,2)-n
        mymask=fi(i:i+m-1,j:j+n-1,v);
        h=zeros(1,256);
        for x=1:(m*n)
            h(mymask(x)+1)=h(mymask(x)+1)+1;
        end
  %Maximum occurring value and the position is obtained
        [maxvalue,pos]=max(h);
        Image(i,j,v)=pos-1;
    end
end
end
fo = Image;
imwrite(fo, output_path);

end

