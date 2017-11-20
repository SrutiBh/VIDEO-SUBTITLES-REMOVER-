G=F(250).cdata;
v=zeros(1,751);
I=[];
for i=900:1050
    v=G(i,:);
    I=vertcat(I,v);
end
%BW = edge(I,'canny');
BW = edge(BW,'sobel');
%BW = edge(BW,'Prewitt');
%BW = edge(BW,'Roberts');
BW = edge(BW,'log');

%[H,T,R]=hough(BW);
start_angle = 88;
end_angle = 90-0.5;
theta_resolution = 0.5;

[H,T,R] = hough(BW, 'Theta', start_angle:theta_resolution:end_angle);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,2,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',10);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end