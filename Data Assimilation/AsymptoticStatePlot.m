function AsymptoticStatePlot
rows = 200; 
columns = 100; 
x = zeros(columns,1); 
for a = 1:0.01:4, 
x(1) = 0.5; 
for n = 1:rows, 
x(1) = a*x(1)*(1 - x(1)); 
end 
for n = 1:columns-1, 
x(n+1) = a*x(n)*(1 - x(n)); 
end 
plot(a*ones(columns,1), x, '.'); 
hold on; 
end 
title('Asymptotic state Plot'); 
xlabel('a');  
ylabel('x*(a)'); 
%set(gca, 'xlim', [1.0 4.0]); 
hold off;
end