img2= imread();
J = imadjust(img2,[],[],a); %gamma correction %adjust gamma value by changing a
imshow(J);