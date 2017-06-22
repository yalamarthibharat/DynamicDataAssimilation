function LyapnovPlot
a=1:0.001:4;
N = length(a);
M=1000;
P=100000;
for j=1:N
aa = a(j)
x=0.5;
for k=1:M
x = aa*x*(1-x);
end
bb=0;
for k=1:P
x = aa*x*(1-x);
bb = bb + log(aa*abs(1-2*x));
end
b(j) = bb/P;
end
plot(a,b)
title('Plot of Lyapnov function Vs Alpha');
axis([1 4 -1 0.8])
end