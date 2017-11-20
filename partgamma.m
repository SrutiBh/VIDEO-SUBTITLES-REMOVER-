%%%%%%%%%%%%%%%%%%part gamma try%%%%%%%%%%%%%%%%%%%%
x= imread('page4.jpg');
subplot(2,2,1); imshow(x); title('Input Image');
x= rgb2gray(x);
subplot(2,2,2); imshow(x); title('Grayscale Image');
[M N]=size(x); %length and width of the image matrix
C=zeros(M,N); %creating an empty matrix to store output image
C = uint8(255 * mat2gray(C)); %converting double matrix to int8
P=60; %selecting height of the pixel box
Q=80; %selecting width of the pixel box
overlap1=20; %overlapping pixel value across height
overlap2=30; %overlapping pixel value across width
p=P-overlap1;
q=Q-overlap2;
A=zeros(P,Q); %creating an empty matrix for the pixel box
A = uint8(255*mat2gray(A));%converting double matrix to int8
i=1;j=1;
while(i< M+p)
    while(j< N+q)
        %for cases excluding the border case
        if(i+P-1<=M && j+Q-1<=N)     
           for m= i: i+P-1
              for n= j: j+Q-1
                  A(m-i+1,n-j+1)=x(m,n); %storing the pixel values in the pixel box
              end
           end;
           [J T]=histeq(A); %treating the box as separate image and applying histogram equalization
%            I_double= im2double(J);
%            b = find(I_double==0);
%            w = find(I_double==1);
%            a=w/b;
%            J = imadjust(J,[],[],a);
           for m=i: i+P-1
               for n=j: j+Q-1
                   C(m,n)=J(m-i+1,n-j+1);%storing the values in an output matrix
               end
           end
        %the border cases   
        else
           A=zeros(P,Q); %creating an empty matrix for the pixel square      
           A = uint8(255*mat2gray(A));%converting double matrix to int8
           for m=i:M
            for n=j:N
                A(m-i+1,n-j+1)=x(m,n);
            end
           end 
          [J T]=histeq(A); %treating the box as separate image and applying histogram equalization
%            I_double= im2double(J);
%            b = find(I_double==0);
%            w = find(I_double==1);
%            a=w/b;
%            J = imadjust(J,[],[],a);
          for m=i:M
              for n=j:N
                  C(m,n)=J(m-i+1,n-j+1); %storing the values in the output matrix
              end
          end
        end
        j=j+q; %the box moving along width of the image keeping the overlap in consideartion
    end
    j=1;
    i=i+p; %the box moving along height keeping the overlap in consideration
end
subplot(2,2,3);imshow(C); 
title('Histogram modification done separately');
[J T] = histeq(x);
subplot(2,2,4); imshow(J);
title('Histogram modification done as whole');