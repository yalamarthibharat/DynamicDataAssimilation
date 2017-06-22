function gradientAlgorithm
n=16;
A=zeros(n,n);
d =6;
y(1) = 1;
for i=1:n
x(i,1)=1;
end
B = -1 + (1+1)*rand(n,1);
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
r(i,1)=B(i)-(A(i,:)*(x(:,1)));
end
k = 1;
while(norm(r(:,k))>(10^-d))
num = (r(:,k))'*r(:,k);
denom = (r(:,k))'*A*(r(:,k));
alpha(k)=(num)/(denom);
x(:,k+1)=x(:,k)+alpha(k)*r(:,k);
inter = alpha(k)*A*(r(:,k));
r(:,k+1)=r(:,k)- (inter);
inter1 = (0.5)* (x(:,k+1))'*A*x(:,k+1);
inter2 = B' * x(:,k+1);
f(k+1)= inter1 - inter2;
y(k+1)=k+1;
k = k+1;
end
display(A);
display(B);
display(f);
display(y);
plot(f,y);
end 