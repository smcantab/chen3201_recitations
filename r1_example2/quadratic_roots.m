function quadratic_roots(a, b, c)
    % QUADRATIC_ROOTS Function to determine the solution to a quadratic
    % equation of the form
    % ax^2 + bx + c = 0
    % Input: Coefficients a, b, c
    % Output: None byt prints
    %   r1 and i1 - real and imaginary parts of the first root
    %   r2 and i2 - real and imaginary parts of the second root

    if a == 0
       if b ~= 0
           r1 = - c/b;
           fprintf('Single Root: %10.4f \n', r1)
       else
           error('a=0 and b=0 ---> No solution!')
       end
    else
        d = b^2 - 4*a*c;
        if d >= 0
            r1 = (-b + sqrt(d))/(2*a);
            r2 = (-b - sqrt(d))/(2*a);
            fprintf('Real Root 1: %10.4f \n', r1)
            fprintf('Real Root 2: %10.4f \n', r2)
        else
            r1 = -b/(2*a);
            i1 = sqrt(abs(d))/(2*a);
            r2 = r1;
            i2 = -i1;
            fprintf('real root 1 %10.4f \n', r1)
            fprintf('imaginary root 1 %10.4f \n', i1)
            fprintf('real root 2 %12.4f \n', r2)
            fprintf('imaginary root 2 %12.4f \n', i2)
        end
    end

end

