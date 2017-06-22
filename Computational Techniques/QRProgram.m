function QRProgram
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
mat_len=length(H);
[m,n]=size(H);
v_modi=zeros(mat_len);
q_modi=v_modi;
r_modi=zeros(size(H));
for i=1:n
   v_modi(:,i)=H(:,i) ;
   
end
for j=1:n
    r_modi(j,j)=norm(v_modi(:,j));
    q_modi(:,j)=v_modi(:,j)/r_modi(j,j);
    for i=j+1:n
        r_modi(j,i)=q_modi(:,j)'*v_modi(:,i);
        v_modi(:,i)=v_modi(:,i)-r_modi(j,i)*q_modi(:,j);
        
    end
end
display(H);
display(q_modi,'Matrix Q');
display(r_modi,'Matrix R');
err=H-q_modi*r_modi;
sum=0;
for i=1:n;
    for j=1:n;
        sum_val = err(i,j)*err(i,j);
        sum=sum+sum_val;
    end
end
display(sum,'Error');
b = ones(18,1);
QTB = q_modi'*b;
R = r_modi;
%Solving the Upper triangular system
x(n) = QTB(n)/R(n,n);
for i = 1:n-1;
    temp3 = 0;
    for j=i+1:n;
        temp3 = temp3+(R(i,j)*x(j));
    end
    x(i) = (QTB(i)-temp3)/R(i,i);
end
display(x,'Xls');
end