function c_exact=exact_sol(x, t, k) 
c_temp = 0; %Initialize the sum to zero
%Construct a loop to add the value of each Fourier mode to the sum
for j=1:k
c_temp = c_temp + 2*sin(j*pi*x)*exp(-t*(j*pi)^2)/(j*pi);
end
%compute the exact concentration
c_exact = 1-x-c_temp;
end

