I= imread();
[J T] = histeq(rgb2gray(I)); %histogram modification on img1
imshow(J);