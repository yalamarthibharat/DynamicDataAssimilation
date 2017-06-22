function [f,y]=jacobiAlgorithm
n=16;
B = -1 + (1+1)*rand(n,1);
A=zeros(n,n);
L =zeros(n,n);
U =zeros(n,n);
k=1;
d = 6;
y(1) = 1;
for i=1:n
x(i,1)=1;
end
f(1) = ((0.5)*(x(:,1))'*A*x(:,1))-(B'*x(:,1));
for i=1:n
    for j=1:n
        if(i>=j)
            A(i,j) = -1 + (1+1)*rand(1,1);
        end
        A(j,i)=A(i,j);
        if(i==j)
            A(i,j)=A(i,j)+100;
        end
    end
end
for i=1:n
    for j=1:n
    if(i<j)
        U(i,j)=A(i,j);
    end
    if(i>j)
        L(i,j) = A(i,j);
    end
    end
end
D = A - (L+U);
N =D;
M = -(L+U);
while(true)
    inter1 = inv(N)*M*(x(:,k));
    inter2 = inv(N)*B;
    x(:,k+1) = inter1+inter2;
    inter3 = (0.5)* (x(:,k+1))'*A*x(:,k+1);
    inter4 = B' * x(:,k+1);
    f(k+1)= inter3 - inter4;
    y(k+1)=k+1;
    if(norm((x(:,k+1))-(x(:,k))) < (10^(-d)))
        break;
    end
    k=k+1;
end
display(A);
display(B);
display(f);
display(y);
plot(f,y);
end