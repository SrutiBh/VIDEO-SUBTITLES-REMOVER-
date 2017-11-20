G=F(100).cdata;
imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
figure;plot(v);
k=find(v<100);
Sub=G;
for i=933:961
    for j=1:1000
        G(i,j)=(double((G(932,j)+G(962,j))/2));
        G(i,j)=uint8(G(i,j));
    end
end
for i=986:999
    for j=1:1000
        G(i,j)=(double((G(985,j)+G(1000,j))/2));
        G(i,j)=uint8(G(i,j));
    end
end
figure; imshow(G);
