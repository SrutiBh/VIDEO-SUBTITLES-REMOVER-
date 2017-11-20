%Make a grayscale copy of our input image
img=imread('S1.jpg');
I = double(rgb2gray(img));
%Determine input image dimensions
[j k] = size(I);
%Determine the extreme intensity values for our input image
in_min = double(min(min(I)));
in_max = double(max(max(I)));
%Determine the extreme intensity values for the output image
out_min = double(1);
out_max = double(1);
%Determine the amount to "shift/move" pixel intensity values by
shift_val = in_min - out_min;
%Determine the value to "scale" pixel intensity values by
scale_val = (out_max)/(in_max-in_min);
%Perform the shift and scale (in that order)
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(I(counter1,counter2)-double(shift_val))*double(scale_val);
 end
end
B=I;
%Perform the gamma correction operation
subplot(1,3,1);
gamma_value=0.5;
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(I(counter1,counter2)).^gamma_value;
 end
end
output_image = I;
imshow(I);
title('Gamma value=0.5');

subplot(1,3,2);
gamma_value=1;
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(B(counter1,counter2)).^gamma_value;
 end
end
output_image = I;
imshow(I);
title('Gamma value=1.0');

subplot(1,3,3);
gamma_value=2;
for counter1 = 1:j
 for counter2 = 1:k
 I(counter1,counter2)=(B(counter1,counter2)).^gamma_value;
 end
end
output_image = I;
imshow(I);
title('Gamma value=2.0');