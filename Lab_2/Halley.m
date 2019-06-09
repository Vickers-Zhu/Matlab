function [solution, no_iterations] = Halley(f, dfdx, dfdxs, x0, eps)
    x = x0;
    f_value = f(x);
    disp(f_value);
    iteration_counter = 0;
    while abs(f_value) > eps && iteration_counter < 100
        try
            x = x - 2*(f_value)*dfdx(x)/(2*dfdx(x)^2 - f_value*dfdxs(x));
        catch
            fprintf('Error! - derivative zero for x = \n', x)
            exit(1)
        end
        f_value = f(x);
        iteration_counter = iteration_counter + 1;
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_value) > eps
        iteration_counter = -1;
    end
    solution = x;
    no_iterations = iteration_counter;
end