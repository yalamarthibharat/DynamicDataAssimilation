function luDecomposition
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
z = l*u;
err = A-z;
sum=0;
for i=1:n;
    for j=1:n;
        sum_val = err(i,j)*err(i,j);
        sum=sum+sum_val;
    end
end
display(H);
display(A);
display(l,'Matrix L');
display(u,'Matrix U');
display(sum,'Error');
end