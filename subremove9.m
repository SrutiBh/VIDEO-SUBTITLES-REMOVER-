function [out] = subremove9(image,d)
G=flipud(image);
%imshow(G);
Max=max(G,[],2);
Min=min(G,[],2);
v=Max-Min;
%figure;plot(v);
k=find(v<145);
k(1:250)=[];
[n,o]=size(k);
Sub=G;
Diff=diff(k);
idx=find(Diff>1);
if(~isempty(idx))
[l,o]=size(idx);
depth=d;
for p=1:l-1
    rows=k(idx(p+1))-k(idx(p)+1);
    rows=round(rows/2,0);
    
   
    for i=k(idx(p)+1)-depth:k(idx(p)+1)+rows
        for j=1:1000
            G(i,j)=double(G(i-rows-depth,j));
            G(i,j)=uint8(G(i,j));
        end
    end
    for i=k(idx(p)+1)+rows : k(idx(p+1))+depth
        for j=1:1000
            G(i,j)=double(G(i+rows+depth,j));
            G(i,j)=uint8(G(i,j));
        end
    end     
end

rows=k(n)-k(idx(l)+1);
rows=round(rows/2,0);

for i=k(idx(l)+1)-depth:k(n)+depth
    for j=1:1000
        G(i,j)=G(i-rows-depth,j);
    end
end
% for i=k(idx(l)+1)+rows : k(n)+depth
%     for j=1:1000
%         G(i,j)=G(i+rows+depth,j);
%     end
% end
out=flipud(G);
else
out=flipud(G);
end
%figure;imshow([Sub G]);
end
