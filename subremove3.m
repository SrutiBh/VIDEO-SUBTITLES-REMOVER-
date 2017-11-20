G=F(100).cdata;
figure;imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
figure;plot(v);
k=find(v<100);
Sub=G;
for i=933:940
    for j=1:1000
        G(i,j)=double(G(930,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=941:947
    for j=1:1000
        G(i,j)=(double(G(964,j))+3*double(G(930,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=948:954
    for j=1:1000
        G(i,j)=(3*double(G(964,j))+double(G(930,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=955:962
    for j=1:1000
        G(i,j)=double(G(964,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=986:989
    for j=1:1000
        G(i,j)=double(G(984,j));
        G(i,j)=uint8(G(i,j));
    end
end
for i=990:993
    for j=1:1000
        G(i,j)=(3*double(G(984,j))+double(G(1002,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=994:996
    for j=1:1000
        G(i,j)=(double(G(984,j))+3*double(G(1002,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=997:999
    for j=1:1000
        G(i,j)=double(G(1002,j));
        G(i,j)=uint8(G(i,j));
    end
end
figure; imshow(G);
