function [] = subremoval(vid, strtf, endf)
%%%%%%%%%%%%%%%%%XTYTXY Frame remove subtitles%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%vid=VideoReader('TEST.mp4'); %read video and store in variable vid
%strtfrm=40; endfrm=50;
rangeLow=300; rangeHigh=1050;
nFrames=vid.NumberOfFrames; %no of frames = nframes
midgap= endf - strtf + 1;
rng =(1000-midgap)/2;
rng = round(rng,0);
if(endf+rng>=nFrames)
    endfrm=nFrames;
else
    endfrm=endf+rng;
end 
if(strtf-rng<=0)
    strtfrm=1;
else
    strtfrm=strtf-rng;
end


M=vid.Height; % no of rows

N=vid.Width; % no of columns

video=zeros(M,N,(endfrm - strtfrm+1),'uint8'); % creating a video 3d null matrix

% take 50 consecutive frames from the video in 3d matrix
for k= strtfrm:endfrm  

im= read(vid,k); %read frame from video 

im=im(:,:,1);% all three layers will have same image %fillup pixel values in the video matrix

video(:,:,k-strtfrm+1)=im; %fillup k-th frame in the video matrix
end

YTvideo=zeros(M,endfrm-strtfrm+1,rangeHigh-rangeLow+1,'uint8'); % creating a video 3d null matrix
for x=rangeLow:rangeHigh %subtitles lies in this range of pixels %see subrange.m
    img= (squeeze(video(:,x,:))); %from 3d to 2d using squeeze %to see yt frames

    loop=2;
    while(loop>1)
    img=subremove7(img,loop);
    img=subremove4(img,loop); 
    loop=loop-1;
    end
    %img=subremove8(img,0);
    %cmap=gray(256); %defining colorap for grayscale images
    %A= im2frame(img,cmap);% converting the image into video frames
    YTvideo(:,:,x-rangeLow+1)=(img);
    %figure; imshow(YTvideo(:,:,x));
    %F=[F A]; %storing the frames in a matrix
end

    modvideo=zeros(M,rangeHigh-rangeLow+1,(endfrm-strtfrm+1),'uint8');
for x=1:(endfrm-strtfrm+1) %subtitles lies in this range of pixels %see subrange.m
    img= (squeeze(YTvideo(:,x,:))); %from 3d to 2d using squeeze %to see yt frames

    %cmap=gray(256); %defining colorap for grayscale images
    %A= uint8(im2frame(img,cmap));% converting the image into video frames
    modvideo(:,:,x)=(img);
    %F=[F A]; %storing the frames in a matrix
end

for x=1: (endf-strtf+1)
    figure;imshow([video(:,rangeLow:rangeHigh,x) modvideo(:,:,x)]);
    title(['The ' num2str(x+strtf-1) 'th XY frame before and after']);
end
end

