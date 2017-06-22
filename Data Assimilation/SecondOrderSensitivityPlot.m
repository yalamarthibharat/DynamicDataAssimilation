function SecondOrderSensitivityPlot
alpha=4;
u1(1)=1;
u2(1)=0;
x(1)=0.6;
index(1)=1;
n=150;
for i=1:n
x(i+1)=alpha*x(i)*(1-x(i));
d1(i)=alpha*(1 - 2*x(i));
d2(i)=-2*alpha;
u1(i+1)=d1(i)*u1(i);
u2(i+1)=(d1(i)*u2(i))+(d2(i)*u1(i)*u1(i));
index(i+1)=i+1;
end
display(u2);
%plot(u2,index);
%title('Plot of second order Senstivity for U');
%----------------------------------------------------------------------------
%----------------------------------------------------------------------------
%code for V
v1(1)=0;
v2(1)=0;
for j=1:n
  x(j+1)=alpha*x(j)*(1-x(j));
  dx(j)=alpha*(1 - 2*x(j));
  da(j)=x(j)*(1-x(j));
  d2x(j)=-2*alpha;
  dxa(j)=(1-2*x(j));
  d2a(j)=0;
  v1(j+1) = dx(j)*v1(j) + da(j);
  v2(j+1)=(dx(j)*v2(j))+(d2x(j)*v1(j)*v1(j))+(2*dxa(j)*v1(j))+(d2a(j));
  index(j+1)=j+1;
end
%plot(v2,index);
%title('Plot of second order Senstivity for V');
%----------------------------------------------------------------------------
%----------------------------------------------------------------------------
%code for UV
w(1)=0;
u(1)=1;
v(1)=0;
for k=1:n
  x(k+1)=alpha*x(k)*(1-x(k));
  dx(k)=alpha*(1 - 2*x(k));
  d2x(k)=-2*alpha;
  dxa(k)=(1-2*x(k));
  u(k+1)=dx(k)*u(k);
  v(k+1) = dx(k)*v(k) + da(k);
  w(k+1)=(dx(k)*dxa(k))+(d2x(k)*u(k)*v(k))+(dxa(k)*u(k));
  index(k+1)= k+1;
end
plot(w,index);
title('Plot of second order Senstivity for UV');
end