function [xout, yout] = ivp_predictor_corrector_sys(x0, y0, h, nsteps, iout)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% x0 = vector, initial value for x
% y0 = vector, initial value for y
% h = step size
% iout = frequency to output x and y to [xout, yout]
% nsteps = number of steps
% requires the function getf(x, y) 
nout = fix(nsteps / iout); %number of output points (fix rounds towards zero)
xout = zeros(nout+1, 1); %pre-allocate xout
yout = zeros(nout+1, length(y0)); %pre-allocate yout
x = x0; xout(1) = x0; %set/store initial condition on x
y = y0; yout(1, :) = y0; %set/store initial condition on y
kout = 1; %counter for [xout, yout]
for i = 2:nsteps+1
    yp = y + h * getf(x, y); %predictor
    yc = y + h * getf(x+h, yp); %corrector
    y = 0.5 * (yp + yc);
    x = x + h; %increase step
    if mod(i, iout) == 0 || i == nsteps + 1
        xout(kout) = x;
        yout(kout, :) = y;
        kout = kout + 1;
    end
end

end

