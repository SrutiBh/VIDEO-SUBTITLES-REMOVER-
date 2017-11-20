function [out] = subremove5(image,d)
G=image;
%imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
%figure;plot(v);
k=find(v<145);
[n,o]=size(k);
Sub=G;
depth=d;
Diff=diff(k);
idx=find(Diff>1);
if(~isempty(idx))
[l,o]=size(idx);
for p=1:l-1
    rows=k(idx(p+1))-k(idx(p)+1);
    rows=round(rows,0);
    for i=k(idx(p)+1)-depth:k(idx(p+1))+depth
        for j=1:1000
            G(i,j)=double(G(i-rows,j));
            G(i,j)=uint8(G(i,j));
        end
    end     
end

rows=k(n)-k(idx(l)+1);
rows=round(rows,0);
for i=k(idx(l)+1)-depth: k(n)+depth
    for j=1:1000
        G(i,j)=G(i-rows,j);
    end
end
out=G;
else
out=G;
end
%figure;imshow([Sub G]);
end
