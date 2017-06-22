function luProgram
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
A = transpose(H)*H;
l = zeros(n,n);
u = zeros(n,n);
display(A);
for i=1:n;
    for j=1:n;
        if (i==j)
            l(i,j)=1;
        end
    end
end
for r = 1:n;
    for i = r:n;
        temp=0;
        for j=1:r-1;
            temp = temp + (l(r,j)*u(j,i));
        end
        u(r,i) = A(r,i) - temp;
    end
    for i = r+1:n
        temp1=0;
        for j=1:r-1
            temp1 = temp1 + (l(i,j)*u(j,r));
        end
        l(i,r) = (A(i,r)-temp1)/u(r,r);
    end
end
display(l);
display(u);
z = l*u;
err = A-z;
sum=0;
for i=1:n;
    for j=1:n;
        sum_val = err(i,j)*err(i,j);
        sum=sum+sum_val;
    end
end
display(sum,'Error');
b=ones(16,1);
%Solving the Lower triangular system
g(1)= b(1)/l(1,1);
for i=2:n;
    temp2=0;
    for j=1:i-1;
        temp2 = temp2+ (l(i,j)*g(j));
    end
    g(i) = (b(i)-temp2)/l(i,i);
end
%Solving the Upper triangular system
x(n) = g(n)/u(n,n);
for i = 1:n-1;
    temp3 = 0;
    for j=i+1:n;
        temp3 = temp3+(u(i,j)*x(j));
    end
    x(i) = (g(i)-temp3)/u(i,i);
end
display(x,'Xls');
end