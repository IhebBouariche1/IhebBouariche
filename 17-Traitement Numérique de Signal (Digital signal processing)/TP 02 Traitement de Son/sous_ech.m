function [y2,fe2]=sous_ech(y1,fe1)
fe2=8000;
t1=0:1/fe1:(length(y1)-1)/fe1;
N=1000;
wn = 8000/(fe1/2);
B=fir1(N,wn,'low');
A=[0.5,0.5];
z1=filter(B,A,y1);
t2=0:1/fe2:t1(end);
y2=zeros(size(t2));
for k=1:length(t2)
  i=find(t1>=t2(k),1,'first');
  y2(k)= y1(i);
end
end

