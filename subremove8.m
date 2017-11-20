function [out] = subremove8(image,d)
G=image;
[M2,N2]=size(G);
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
    
    for i=k(idx(p)+1)-depth:k(idx(p+1))+depth
        G(i,:)=0;
    end     
end

for i=k(idx(l)+1)-depth: k(n)+depth
    G(i,:)=0;
end
Max=max(G,[],2);
Min=min(G,[],2);
v1=Max-Min;
k=find(v1==0);
G(k,:)=[];
[M3,N3]=size(G);
v1=zeros(M2-M3,N2);
v1=uint8(v1);
G=vertcat(G,v1);
out=G;

else
out=G;
end
%figure;imshow([Sub G]);
end
