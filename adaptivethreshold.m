I=imread();

T = adaptthresh(img2, sens); %adaptive thresholding change value
BW = imbinarize(img2,T);
imshow(BW);

