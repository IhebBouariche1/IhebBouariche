function PMCT=c_PMCT(xk,x)
PMCT=s_c_PMCT(xk); 
t1=0:3/(length(x)):3-1/length(x);
t2=0:3/(length(PMCT)):3-1/length(PMCT);
figure();
plot(t1,abs(x)); 
hold on;
plot(t2,max(x)*100*PMCT); 
hold off;


