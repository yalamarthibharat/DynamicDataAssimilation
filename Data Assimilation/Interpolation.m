function Interpolation
m=90;
nx=40;
ny=30;
n=1200;
res=1;
y=[1:m];
i=y';
s = [0.1 0.5 1.0 2.0 5.0];
ai = rand(m,1);
bi = rand(m,1);
aibar = 1-ai;
bibar = 1-bi;
Table = table(i,ai,bi,aibar,bibar);
abarb = diag(aibar*transpose(bi));
abbar = diag(ai*transpose(bibar));
ab = diag(ai*transpose(bi));
abarbbar = diag(aibar*transpose(bibar));
k = randi([1 n-nx-1],1,m)
display('---------------------------------------------------------');
c=1;
for a = 1:m
    for j = 1:n
        H(a,j)=0;
        H(a,k(c))= abarbbar(a);
        H(a,k(c)+1)= abbar(a);
        H(a,k(c)+nx)= abarb(a);
        H(a,k(c)+nx+1)= ab(a);
    end
    c=c+1;
end
display(Table,'Table for ai,bi');
display('---------------------------------------------------------');
%display(H);
format short;
%display('---------------------------------------------------------');
for a=1:5
vi = normrnd(0,s(a),[m 1]);
z = 75+vi;
Table1 = table(i,vi,z);
HT = H';
HHT = H*HT;
HHT_1 = inv(HHT);
HTHHT_1 = HT*HHT_1;
xls = HTHHT_1*z;
format short;
Hxls = H*xls;
Z_Hx = z-Hxls;
Z_Hxt = Z_Hx';
residual_norm_square = Z_Hxt*Z_Hx;
residual_norm = sqrt(residual_norm_square);
q(res) = residual_norm;
res=res+1;
display(s(a),'Variance');
display(Table1,'Table for Variance');
display(residual_norm);
display('---------------------------------------------------------');
end
display(q,'Array with all residual norms');
plot(s,q);
end