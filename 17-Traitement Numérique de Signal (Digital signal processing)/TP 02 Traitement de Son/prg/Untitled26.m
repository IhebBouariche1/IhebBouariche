clear
xn=0:5;
tn=0:5;
tpn=0:3;
yn=[0 2 4 5];
delta=5;
Phi_x =[ 1 2 3 4 5 6];
Phi_y =[ 1 1 1 2 3 4];
ok=1; %ok=0 pour regénérer une nouvelle solution
e_=[1 0;1 1; 0 1];
e=@()e_(ceil(rand(1)*3),:);
while(~ok)
Phi_x=[1];
Phi_y=[1];
while(1)
e_v=e();
Phi_x=[Phi_x(:)' Phi_x(end)+e_v(1)];
Phi_y=[Phi_y(:)' Phi_y(end)+e_v(2)];
if Phi_x(end)>=length(xn) break; end
if Phi_y(end)>=length(tpn) break; end
end
ok=1;
if ~(Phi_x(end)==length(xn)) ok=0; end
if ~(Phi_y(end)==length(tpn)) ok=0; end
if ~(max(abs(Phi_y-Phi_x))<=delta) ok=0; end
end
figure(1); plot(tn,xn-0.05,'bx-',tpn,yn-0.05,'gx-',tpn(Phi_y),xn(Phi_x),'rx-','Linewidth',2);
axis([-0.1 max(max(tpn),max(tn))+0.1 -0.1 max(max(xn),max(yn))+0.1])
xlabel('t_n'),
text(0.5*(tn(4)+tn(5)),0.5*(xn(4)+xn(5))-0.1,'\leftarrow (t_n,x_n)','FontSize',14);
text(0.5*(tn(2)+tn(3)),0.5*(yn(2)+yn(3))-0.1,'\leftarrow (t_n,y_n)','FontSize',14);
text(0.5*(tpn(Phi_y(4))+tpn(Phi_y(5))),0.5*(xn(Phi_x(4))+xn(Phi_x(5)))-0.1,'\leftarrow (t_{\Phi,y}Axis=[-1.1 max(max(length(tpn)),max(length(tn)))+1.1.-1.1 max(max(length(xn)),max(length(yn)))+1.1]';
figure(2); plot(Phi_x-1,Phi_y-1,'o-',...
[Axis(1), Axis(2)],delta+[Axis(1), Axis(2)],'k-',...
[Axis(1), Axis(2)],delta+[Axis(1), Axis(2)]+0.05,'k:',...
[Axis(1), Axis(2)],delta+[Axis(1), Axis(2)]+0.1,'k:',...
[Axis(1), Axis(2)],-delta+[Axis(1), Axis(2)],'k-',...
[Axis(1), Axis(2)],-delta+[Axis(1), Axis(2)]-0.05,'k:',...);
[Axis(1), Axis(2)],-delta+[Axis(1), Axis(2)]-0.1,'k:',...
'LineWidth',2);
axis(Axis)
for k=1:length(Phi_x)
dk=(yn(Phi_y(k))-xn(Phi_x(k))).^2;
text(Phi_x(k)-0.4-1,Phi_y(k)+0.4-1,num2str(dk,'%2.1f'));
end
text(3,5,'Lieu permis'),
xlabel('\Phi_x[n]'), ylabel('\Phi_y[n]'),