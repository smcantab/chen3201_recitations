function zero_order_continuation
    clear;clc
    x = 0;
    tol = 1e-4;
    
    for i=1:10
        p = i*10;
        f = getf(x, p); %initialize residual  value
        while abs(f) > tol
            df = getdf(x, p);
            x = x - f/df; %Newton's method
            f = getf(x, p); %update function value
        end
        p_list(i) = p;
        x_list(i) = x;
    end
    plot(p_list, x_list, 'or')
end

function f = getf(x, p)
    f = x^3 - 5 * exp(x^2) + 2 * p * x - 7;
end

function df = getdf(x, p)
    df = 3 * x^2 - 10 * x * exp(x^2) + 2 * p;
end

