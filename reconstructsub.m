[M1,N1]=size(F(1).cdata);
[U,L]=size(F);
video=zeros(M1,N1,L,'uint8'); % creating a video 3d null matrix

for k= 1:L %divide video by 1000 by 1000 frames to run easily 

im= F(k).cdata; %read frame from video 

im=im(:,:,1);% all three layers will have same image %fillup pixel values in the video matrix

video(:,:,k)=im; %fillup k-th frame in the video matrix
end

H=[];
for t=1:100 %subtitles lies in this range of pixels %see subrange.m
    img= (squeeze(video(:,t,:))); %from 3d to 2d using squeeze %to see yt frames
    v=zeros(1,601);
I=[];
for i=900:1050
    v=img(i,:);
    I=vertcat(I,v);
end

%
% 
% z=(1/25)*ones(5,5);%defining 5x5 mean filter
% h=(1/26.0039)*filtmatx;%defining 10x10 slant filter
% I=imfilter(I,h);
% t=5;
% while(t>0)
% I=imfilter(I,z);
% t=t-1;
% end
%

%PSF  = fspecial('gaussian',10,0.1);


%PSF = fspecial('motion', 20, 10); 

%[I,PSF] = deconvblind(I, InitPSF);
%edgesTapered = edgetaper(I,PSF)
%imshow(edgesTapered);

% I = deconvlucy(I, PSF,0.00000000001);
% tt=2;
% while(tt>0)
% I = imsharpen(I,'Amount',9);
% tt=tt-1;
% end

%h=fspecial('disk',6);
 %I=imfilter(I,h);
 %I=imsharpen(I,'Amount',1);
  
%z=(1/25)*ones(5,5);%defining 5x5 mean filter
%I=imfilter(I,z);
%I=medfilt2(I);
%imshow(J);
%I=imgaussfilt(I);
for i=906:1044
    img(i,:)=I(i-899,:);
end
cmap=gray(256); %defining colorap for grayscale images
    A= im2frame(img,cmap);% converting the image into video frames
H=[H A]; %storing the frames in a matrix
    
end
% s=zeros(10,10);
% for i=0:9
%     v=(1/(2^i))*ones(1,10-i);
%     h=diag(v,i);
%     s=s+h;
% end

%movie(H);
[h, w, p] = size(H(1).cdata); %obtaining the height, width of the frmaes
hf=figure; 
set(hf,'Position',[0 0 w h]); %positining the figure according to the frames
%movie(H);
movie(hf,H,1,40); %run 1 time, 5fps


% [M4,N4]=size(I);
% I1=I;
% for i=1:M4
%     for j=1:N4
%         if (I(i,j)==192)
%             I1=(I(i-1,j-1)+I(i-1,j+1)+I(i+1,j-1)+I(i+1,j+1))/4;
%         end
%     end
% end

% k=find(I1==192);
% v1=I1(k-1);
% v2=I1(k+1);
% v3=(v1+v2)/2;
% I(k)=v3;
% imshow(uint8(I1));figure;
% imhist(uint8(I1));
