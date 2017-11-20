
V=zeros(10,1000);
for i=1:20
    T=F((400+i-1)).cdata;
    V(i,1:1000)=T(928,1:1000);
end
K=20;
for j=1:K
    plot(V(1:10,j));
    hold on;
end



    