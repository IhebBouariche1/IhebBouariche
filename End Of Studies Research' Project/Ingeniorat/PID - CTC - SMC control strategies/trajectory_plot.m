% trajectory plot and comparaison 
x1=0;y1=0;z1=0;
r = size(positions.Data)
for i = 1:1:r(3)
x1 = [x1 positions.Data(1,:,i)];
y1 = [y1 positions.Data(2,:,i)];
z1 = [z1 positions.Data(3,:,i)];
end 
hold off
plot3(x1,y1,z1,'r',x,y,z,'b')