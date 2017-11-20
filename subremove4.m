function [out] = subremove4(image,d)
G=image;
[height, width]=size(G);
%imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
%figure;plot(v);
k=find(v<145);
[n,o]=size(k);
Sub=G;
Diff=diff(k);
idx=find(Diff>1);
if(~isempty(idx))
[l,o]=size(idx);
depth=d;
for p=1:l-1
    rows=k(idx(p+1))-k(idx(p)+1);
    rows=round(rows/4,0);
    for i=k(idx(p)+1)-2:k(idx(p)+1)+rows
        for j=1:width
            G(i,j)=double(G(k(idx(p)+1)-depth,j));
            G(i,j)=uint8(G(i,j));
        end
    end
    for i=k(idx(p)+1)+rows : k(idx(p)+1)+2*rows
        for j=1:width
            G(i,j)=(3*double(G(k(idx(p)+1)-depth,j))+double(G(k(idx(p+1))+depth,j)))/4;
            G(i,j)=uint8(G(i,j));
        end
    end
    for i=k(idx(p)+1)+2*rows : k(idx(p)+1)+3*rows
        for j=1:width
            G(i,j)=(double(G(k(idx(p)+1)-depth,j))+3*double(G(k(idx(p+1))+depth,j)))/4;
            G(i,j)=uint8(G(i,j));
        end
    end
    for i=k(idx(p)+1)+3*rows : k(idx(p+1))+2
        for j=1:width
            G(i,j)=double(G(k(idx(p+1))+depth,j));
            G(i,j)=uint8(G(i,j));
        end
    end     
end

rows=k(n)-k(idx(l)+1);
rows=round(rows/4,0);
for i=k(idx(l)+1)-2:k(idx(l)+1)+rows
    for j=1:width
        G(i,j)=G(k(idx(1)+1)-depth,j);
    end
end
for i=k(idx(l)+1)+rows:k(idx(l)+1)+2*rows
    for j=1:width
        G(i,j)=(3*double(G(k(idx(l)+1)-depth,j))+double(G(k(n)+depth,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=k(idx(l)+1)+2*rows : k(idx(l)+1)+3*rows
    for j=1:width
        G(i,j)=(double(G(k(idx(l)+1)-depth,j))+3*double(G(k(n)+depth,j)))/4;
        G(i,j)=uint8(G(i,j));
    end
end
for i=k(idx(l)+1)+3*rows : k(n)+2
    for j=1:width
        G(i,j)=G(k(n)+depth,j);
    end
end
out=G;
else
out=G;
%figure;imshow([Sub G]);
end
