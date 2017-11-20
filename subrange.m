%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ft for one pixel location%%%%%%%%%%%%
% vid=VideoReader('sample2.mp4'); %read the video using vid variable 
% 
% nFrames=vid.NumberOfFrames; %read no of frames and store in 'nFrames'
% 
% M=vid.Height; % no of rows %get height of the image 
% 
% N=vid.Width; % no of columns %get width of the image
% 
% video = zeros(M,N,nFrames,'uint8'); % creating a video 3d null matrix by storing frames in matrix
% 
% % take 50 consecutive frames from the video in 3d matrix
% for k= 1:nFrames
% 
% im= read(vid,k); %read frame from video %read k-th frame of video and store in 'im'
% 
% im=im(:,:,1);% all three layers will have same image  %convert 2d matrix 'im' to 3d
%              %fillup pixel values in the video matrix
% video(:,:,k)=im; %fillup k-th frame in the video matrix 
% end
% Img=squeeze(video(:,:,100)); %write frame no to see the value 
%                              %and then use data cursor to see pixel
%                              %location           %339.5 176.5  %327.5 138.5
%                              %177.5 83.5 %337.5 160.5 %341.5 143.5
Img=X;
[M,N]=size(Img);
RI = imref2d(size(Img));
RI.XWorldLimits = [0 N];
RI.YWorldLimits = [0 M];
imshow(Img,RI);
error=zeros(1,1080);
for i=1:1080
    error(i)=max(Img(i,1:1000))-min(Img(i,1:1000));
end
plot(error);