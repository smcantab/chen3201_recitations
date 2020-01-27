clc
close all
%set(0,'defaulttextinterpreter','latex')

niter = 6;
a = [1 2 0];
b = [-2 3 -1];

%pre-allocate vectors
ncalcs = zeros(1, niter);
method1_times = zeros(1, niter);
method2_times = zeros(1, niter);

for j = 1:niter
   ncalcs(j) = 10^j;
   
   % measure evaluation time for 10^j steps for method 1
   tic
   for i = 1:ncalcs(j)
       energy = lj(a, b);
   end
   method1_times(j) = toc;
   
   tic
   for i = 1:ncalcs(j)
       energy = lj_fast(a, b);
   end
   method2_times(j) = toc;
   
   fprintf('N = %10d \n',ncalcs(j))
   fprintf('\t Method 1 = %10.6f \n',method1_times(j))
   fprintf('\t Method 2 = %10.6f \n',method2_times(j))
   fprintf('\t ratio = %8.6f \n \n',method1_times(j)/method2_times(j))
end

%plot
h = figure;
loglog(ncalcs, method1_times, '-or', ncalcs, method2_times, '-xb')
legend('Method 1', 'Method 2','Location','NorthWest') 
xlabel('Number of calculations','FontSize',14) 
ylabel('Time for the calculation (s)','FontSize',14) 
title('Solution to s12c3p2','FontSize',14)
%saveas(h,'s12c3p2_solution_figure.eps','psc2')
