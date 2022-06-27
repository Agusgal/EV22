 %mcode to create a mif file
    src = imread('C:\Users\Franco\Documents\Franco\Electrónica V\image1.png');
    gray = rgb2gray(src);
    [m,n] = size( gray ); %size od your picture

    N = m*n; %your ram or rom depth?
    word_len = 8; 
    data = reshape(gray, 1, N);% reshape you picture's data

    fid=fopen('gray_image.mif', 'w'); % open mif file 
    fprintf(fid, 'DEPTH=%d;\n', N);
    fprintf(fid, 'WIDTH=%d;\n', word_len);

    fprintf(fid, 'ADDRESS_RADIX = UNS;\n'); 
    fprintf(fid, 'DATA_RADIX = HEX;\n'); 
    fprintf(fid, 'CONTENT\t');
    fprintf(fid, 'BEGIN\n');
    for i = 0 : N-1
    fprintf(fid, '\t%d\t:\t%x;\n',i, data(i+1));
    end
    fprintf(fid, 'END;\n'); % prinf the end
    fclose(fid); % close your file