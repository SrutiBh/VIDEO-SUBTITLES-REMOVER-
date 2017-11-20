%%%%%%%%%%%%%%%%%XTYTXY Frame remove subtitles%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
vid=VideoReader('TEST.mp4'); %read video and store in variable vid

nFrames=vid.NumberOfFrames; %no of frames = nframes

M=vid.Height; % no of rows

N=vid.Width; % no of columns

video=zeros(M,N,1000,'uint8'); % creating a video 3d null matrix

% take 50 consecutive frames from the video in 3d matrix
for k= 1000:1999 %divide video by 1000 by 1000 frames to run easily, doya kore nicher videor coefficient ta chnage korben...
    %%ekhane 2000:3000 dile niche k-1999 kore deben jate kore k 1 hoite 1000 porjonto range kore 

im= read(vid,k); %read frame from video 

im=im(:,:,1);% all three layers will have same image %fillup pixel values in the video matrix

video(:,:,k-999)=im; %opore 7000 korle niche 6999 kore de, jate 1 thke start hoi fillup k-th frame in the video matrix
end

%display xt frame as image for each y value
F=[]; %define null matrix F to store xt frames to make output as movie
% for y=1:1080 %subtitles lies in this range of pixels %see subrange.m
%     img= (squeeze(video(y,:,:))); %from 3d to 2d using squeeze %to see xt frames
%     cmap=gray(256); %defining colorap for grayscale images
%     A= im2frame(img,cmap);% converting the image into video frames
%     F=[F A]; %storing the frames in a matrix
% end
for x=300:1050 %subtitles lies in this range of pixels %see subrange.m
    img= (squeeze(video(:,x,:))); %from 3d to 2d using squeeze %to see yt frames
%     d=6;
%     while(d>0)
%         img=subremove7(img,4);
%         d=d-1;
%     end
    %img=subremove6(img,4);
    
    %%%%%%%%comment this part to get original YT frames%%%%%%%
    loop=2;
    while(loop>1)
    img=subremove7(img,loop);
  % img=subremove8(img,loop);  %%%
   
   img=subremove4(img,loop); 
   loop=loop-1;
    end
   % img=subremove8(img,1);
  %  img=subremove4(img,3);
   %  img=subremove9(img,3);
img=subremove5(img,10);
%%%%%%%%%%%%end of YT frame modification%%%%%%%%

    cmap=gray(256); %defining colorap for grayscale images
    A= im2frame(img,cmap);% converting the image into video frames
    F=[F A]; %storing the frames in a matrix
end

%%%%%%%%%%%%%%%%%%%%%to make movie, with figure axes%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%movie(F);
%%%%%%%%%%%%%%%%%%%%%to make movie with specified figure properties%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[h, w, p] = size(F(1).cdata); %obtaining the height, width of the frmaes
hf=figure; 
set(hf,'Position',[0 0 w h]); %positining the figure according to the frames
movie(F,1,20);
%movie(hf,F,1,20); %run 1 time, 5fps 
%%%reconstruction part%%%%%%
% [M1,N1]=size(F(1).cdata);
% [U,L]=size(F);
% video=zeros(M1,N1,L,'uint8'); % creating a video 3d null matrix
% 
% for k= 1:L %divide video by 1000 by 1000 frames to run easily 
% 
% im= F(k).cdata; %read frame from video 
% 
% im=im(:,:,1);% all three layers will have same image %fillup pixel values in the video matrix
% 
% video(:,:,k)=im; %fillup k-th frame in the video matrix
% end
% H=[];
% for t=1:1000 %subtitles lies in this range of pixels %see subrange.m
%     img= (squeeze(video(:,t,:))); %from 3d to 2d using squeeze %to see yt frames
%     cmap=gray(256); %defining colorap for grayscale images
%     A= im2frame(img,cmap);% converting the image into video frames
%     H=[H A]; %storing the frames in a matrix
% end
% %movie(H);
% [h, w, p] = size(H(1).cdata); %obtaining the height, width of the frmaes
% hf=figure; 
% set(hf,'Position',[0 0 w h]); %positining the figure according to the frames
% movie(H,1,50);
% %movie(hf,H,1,20); %run 1 time, 5fps
% 
% for i=580:601
%     figure; imshow(F(i).cdata);
% end
