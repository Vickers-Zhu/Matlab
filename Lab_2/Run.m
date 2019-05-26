function Run()
%     f = @(x) x^4 - 9;
%     dfdx = @(x) 4 * x^3;

    syms x y dx;
    y = x^4 - 900;
    f = @(x) subs(y,x);
    dx = 4 * x^3;
    dfdx = @(x) subs(dx, x);

    eps = 1e-6;
    x0 = 1001;
    [solution,no_iterations] = Halley(f, dfdx, x0, eps);
    if no_iterations > 0   % Solution found
        fprintf('Number of function calls: %d\n', 1 + 2*no_iterations);
        fprintf('A solution is: %f\n', solution)
    else
        fprintf('Abort execution.\n')
    end
end
