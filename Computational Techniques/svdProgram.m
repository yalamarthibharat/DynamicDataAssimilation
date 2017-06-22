function svdProgram
m=18;
nx=4;
ny=4;
n=16;
ai = rand(m,1); 
bi = rand(m,1); 
aibar = 1-ai;
bibar = 1-bi;
abarb = diag(aibar*transpose(bi));
abbar = diag(ai*transpose(bibar));
ab = diag(ai*transpose(bi));
abarbbar = diag(aibar*transpose(bibar));
k = [1 10 1 2 9 2 5 11 3 7 3 7 9 6 5 6 10 11]
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
display(H);
HTH=(H')*H;
[V,D]=eig(HTH);
for i=1:n
    u(:,i)=HTH*V(:,i)/sqrt(D(i,i));
end
display(u,'Matrix U');
lambda_sqrt=sqrt(D);
VT=V';
usqrtlambdavt=u*lambda_sqrt*VT;
err=HTH-usqrtlambdavt;
sum=0;
for i=1:n;
    for j=1:n;
        sum_val = err(i,j)*err(i,j);
        sum=sum+sum_val;
    end
end
display(sum,'Error');
b = ones(16,1);
y1 = u'*b;
display(D);
y2 = (diag(D).^(-1/2));
y3 = diag(y2);
y4 = y3 * y1;
x = V * y4;
display(x,'Xls');
end