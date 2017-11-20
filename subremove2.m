G=F(100).cdata;
figure;imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
figure;plot(v);
k=find(v<100);
Sub=G;
for i=933:947
    for j=1:1000
        G(i,j)=double(G(932,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=948:961
    for j=1:1000
        G(i,j)=double(G(962,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=986:992
    for j=1:1000
        G(i,j)=double(G(985,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=992:999
    for j=1:1000
        G(i,j)=double(G(1000,j));
        G(i,j)=uint8(G(i,j));
    end
end
figure; imshow(G);
