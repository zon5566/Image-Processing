function fo = pixelate(input_path, output_path, step)

fi = imread(input_path);

%fun = @(block) repmat(mean(mean(block.data,1),2), size(block.data) );
fun = @(block_struct) repmat(mean(mean(block_struct.data,1),2),[block_struct.blockSize(1) block_struct.blockSize(2) 1]);
fo = uint8(blockproc(fi, [step step], fun));
imwrite(fo, output_path);
end