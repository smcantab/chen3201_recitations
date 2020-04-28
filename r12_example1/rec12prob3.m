clc
close all

n = 151;
dx = 1/(n-1);
Csol = pde_solve(n);

fprintf('Unpacking the results.\n')
%unpack for plotting
c = zeros(n,n);
x = zeros(n,n);
y = zeros(n,n);
for i = 1:n
    for j = 1:n
        k = (i-1)*n + j;
        c(i,j) = Csol(k);
        x(i,j) = (j-1)*dx;
        y(i,j) = (i-1)*dx;
    end
end
fprintf('\t Finished in t = %10.4f seconds.\n\n',toc)

%plot the concentration
h = figure;
mesh(x,y,c)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
zlabel('c','FontSize',14)

%plot the boundary concentration
h = figure;
plot(x(1,:),c(1,:),'-ok')
xlabel('x','FontSize',14)
ylabel('c(x,0)','FontSize',14)

function C = pde_solve(n)
%setup grid
A = zeros(n^2);
b = zeros(n^2,1);
A = interior(A, n);
[A, b] = edges(A, b, n);
[A, b] = corners(A, b, n);
%solve
A = sparse(A);
C = A\b;
end

function A = interior(A, n)
%interior nodes
for j = 2:n-1
    for i = 2:n-1
        k = i+(j-1)*n; 
        A(k,k-n) = 1;
        A(k,k-1) = 1;
        A(k,k) = -4;
        A(k,k+1) = 1;
        A(k,k+n) = 1;
    end
end
end

function [A, b] = edges(A, b, n)
%bottom nodes
w = 0.5;
dx = 1/(n-1);
i = 1;
for j = 2:n-1
    k = (i-1)*n + j;
    x = (k-1)*dx;
    if mod(x,w) > w/2
        A(k,k-1) = 1;
        A(k,k) = -4;
        A(k,k+1) = 1;
        A(k,k+n) = 2;
    else
        A(k,k) = 1;
        b(k) = 0;
    end        
end
%top nodes
j = n;
for i = 2:n-1
    k = i + (j-1)*n; 
    A(k,k) = 1;
    b(k) = 1;
end
%left nodes
i = 1;
for j = 2:n-1
    k = i + (j-1)*n;
    A(k,k-n) = 1;
    A(k,k) = -4;
    A(k,k+1) = 2;
    A(k,k+n) = 1;
end
%right nodes
i = n;
for j = 2:n-1
    k = i + (j-1)*n;
    A(k,k-n) = 1;
    A(k,k-1) = 2;
    A(k,k) = -4;
    A(k,k+n) = 1;
end
end

function [A, b] = corners(A, b, n)
%corners
A(1,1) = 1; b(1) = 0; %lower left
A(n,n) = -2; A(n,n-1) = 1; A(n,2*n) = 1; b(n) = 0; %lower right
A((n-1)*n+1,(n-1)*n+1) = 1; b((n-1)*n+1) = 1; %upper left
A(n^2,n^2) = 1; b(n^2) = 1; %upper right
end