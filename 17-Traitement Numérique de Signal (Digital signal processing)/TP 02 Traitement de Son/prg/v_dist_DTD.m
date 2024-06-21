function v_dist_DTD(nom_fonction)
  if 1==nargin fct=nom_fonction; else fct=@s_dist_DTD; end 
  test1(fct); 
  test3(fct);
  test2(fct); 
  test4(fct); 
  test5(fct); 
  test6(fct);
  test7(fct); 
  test8(fct); 
end


function test1(fct)
  xn=0:5; yn=[0 2 4 5]; delta=5;
  d_v=sqrt(5)/5; delta_v=5;
  [d_,delta_]=fct(xn(:),yn(:),delta);
  if ~(delta_==delta_v)                                    error('v_dist_DTD'), end
  if ~(abs(d_-d_v)<1e-11)                                  error('v_dist_DTD'), end
end

function test2(fct)
  N=ceil(rand(1)*20)+5;
  xn=rand(1,N); yn=xn; delta=ceil(rand(1)*5)-1;
  [d_,delta_]=fct(xn(:),yn(:),delta);
  if ~(abs(d_)<1e-11)                                      error('v_dist_DTD'), end
  xn=randn(1,N); yn=randn(1,N); delta=0;
  [d_,delta_]=fct(xn(:),yn(:),delta);
  d_v=sqrt(((xn(1)-yn(1)).^2+2*sum((xn(2:end)-yn(2:end)).^2))/(2*N));
  if ~(abs(d_-d_v)<1e-11)                                  error('v_dist_DTD'), end
end

function test3(fct)
  x=[0 2]; y=[0 2]; delta=0; d_v=0; delta_v=0;
  [d_,delta_]=fct(x(:),y(:),delta);
  if ~(delta_==delta_v)                                    error('v_dist_DTD'), end
  if ~(abs(d_-d_v)<1e-11)                                  error('v_dist_DTD'), end
  x=[0]; y=[1]; delta=0; d_v=sqrt(1/2); delta_v=0;
  [d_,delta_]=fct(x(:),y(:),delta);
  if ~(delta_==delta_v)                                    error('v_dist_DTD'), end
  if ~(abs(d_-d_v)<1e-11)                                  error('v_dist_DTD'), end
end


function test4(fct)
  N=ceil(rand(1)*20)+5;
  xn=rand(1,N); yn=randn(1,N); delta=ceil(rand(1)*5);
  [d1,delta1]=fct(xn(:),yn(:),delta);
  [d2,delta2]=fct(xn(:),yn(:),delta-1);
  if ~(d1<=d2+1e-11)                                       error('v_dist_DTD '), end
end

function test5(fct)
  N=ceil(rand(1)*20)+5;
  xn=rand(1,N); yn=randn(1,N); delta=0;
  k=ceil(rand(1)*(N-2))+1;
  xkn=[xn(1:k) yn(k) xn(k+1:N)]; 
  [d,delta]=fct(xn(:),yn(:),delta); 
  [dk,deltak]=fct(xkn(:),yn(:),delta+1); 
  if ~(sqrt(2*N+2)*dk<=sqrt(2*N+1)*d+1e-11)               error('v_dist_DTD '), end
end


function test6(fct)
  entourer=@(u)[1;u;1];
  N=ceil(rand(1)*20)+5;
  x1n=randn(1,N+1); y1n=randn(1,N); delta1=ceil(rand(1)*5)-1;
  x2n=randn(1,N+1); y2n=randn(1,N); delta2=ceil(rand(1)*5)-1;
  xn=[x1n x2n]; yn=[y1n y2n]; delta=max(delta1,delta2);
  [d1,delta1]=fct(entourer(x1n(:)),entourer(y1n(:)),delta1);
  [d2,delta2]=fct(entourer(x2n(:)),entourer(y2n(:)),delta2);
  [dA,deltaA]=fct(entourer(xn(:)),entourer(yn(:)),delta);
  if ~(dA*sqrt(4*N+2)<=sqrt(2*N+2)*d1+sqrt(2*N+2)*d2+1e-11)
                                                           error('v_dist_DTD'), end
end

function test7(fct)
  N=ceil(rand(1)*20)+5; F=ceil(rand(1)*10);
  N2=N+ceil(rand(1)*2);
  xn=randn(N,F); yn=randn(N2,F); delta=ceil(rand(1)*5)-1;
  [d,delta]=fct(xn,yn,delta);
  d_=zeros(1,F); delta_=zeros(1,F); 
  for f=1:F
    [d_(f),delta_(f)]=fct(xn(:,f),yn(:,f),delta);
  end
  if ~all(delta_==delta)                                   error('v_dist_DTD'), end
  if ~(sqrt(sum(d_.^2))<=d+1e-11)                          error('v_dist_DTD'), end
  if 0==delta
    if ~(abs(d-sqrt(sum(d_.^2)))<1e-10)                    error('v_dist_DTD'), end
  end
end


function test8(fct)
  N=ceil(rand(1)*20)+5; N2=N+ceil(rand(1)*2); F=ceil(rand(1)*10);
  lambda=5*rand(1);
  x1n=randn(N,F); y1n=randn(N2,F); 
  x2n=randn(N,F); y2n=randn(N2,F); 
  delta=ceil(rand(1)*10)-1;
  [d1,delta]=fct(x1n,y1n,delta);
  [d_lambda,delta]=fct(lambda*x1n,lambda*y1n,delta);
  [d_ech,delta]=fct(y1n,x1n,delta);
  if ~(abs(d_lambda-abs(lambda)*d1)<=1e-11)                     error('v_dist_DTD'), end
  if ~(abs(d_ech-d1)<=1e-11)                               error('v_dist_DTD'), end
end