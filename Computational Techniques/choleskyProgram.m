function choleskyProgram
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
k = [1 10 1 2 9 2 5 11 3 7 3 7 9 6 5 6 10 11];
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
display(A);
    mat_len=length(A);
    G=zeros(mat_len,mat_len);
    for j=1:mat_len
        sum=0;
        for k=1:j-1
            sum=sum+(G(j,k)^2);
            
        end
        G(j,j)=sqrt(A(j,j)-sum);
        for i=j+1:mat_len
            sum=0;
            for k=1:j-1
                sum=sum+(G(i,k)*G(j,k));
            end
            G(i,j)=(A(i,j)-sum)/G(j,j);
            
        end
    end
    display(G);
    display(G','transpose of G');
    err=A-(G*G');
    sum=0;
for i=1:n;
    for j=1:n;
        sum_val = err(i,j)*err(i,j);
        sum=sum+sum_val;
    end
end
display(sum,'Error');
b=ones(18,1);
GT = G';
HTB = transpose(H)*b;
%Solving the Lower triangular system
g(1)= HTB(1)/G(1,1);
for i=2:n;
    temp2=0;
    for j=1:i-1;
        temp2 = temp2+ (G(i,j)*g(j));
    end
    g(i) = (HTB(i)-temp2)/G(i,i);
end
%Solving the Upper triangular system
x(n) = g(n)/GT(n,n);
for i = 1:n-1;
    temp3 = 0;
    for j=i+1:n;
        temp3 = temp3+(GT(i,j)*x(j));
    end
    x(i) = (g(i)-temp3)/GT(i,i);
end
display(x,'Xls');
end