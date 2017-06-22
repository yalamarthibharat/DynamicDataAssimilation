function FirstOrderSensitivityPlot
alpha=4;
u(1)=1;
x(1)=0.51;
n=150;
index(1)=1;
for i=1:n
x(i+1)=alpha*x(i)*(1-x(i));
d(i)=alpha*(1 - 2*x(i));
u(i+1)=d(i)*u(i);
index(i+1)=i+1;
end
%plot(u,index);
%title('Plot of first order Senstivity for U');
%----------------------------------------------------------------------------
%code for V
v(1)=0;
for j=1:n
  x(j+1)=alpha*x(j)*(1-x(j));
  dx(j)=alpha*(1 - 2*x(j));
  da(j)=x(j)*(1-x(j));
  v(j+1) = dx(j)*v(j) + da(j);
  index(j+1)=j+1;
end
plot(v,index);
title('Plot of first order Senstivity for V');
end