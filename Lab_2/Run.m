function Run(a, b, c, d, m, n, eps)
    f = @(x) x^4 - 1000 + log(x);
    dfdx = @(x) 4 * x^3 + 1/x;
    dfdxs = @(x) 12 * x^2 + 2/x^3;
%     [solution,no_iterations] = Halley(f, dfdx, dfdxs, x0, eps);
    visualise(a, b, c, d, m, n, f, dfdx, dfdxs, eps);
    
end
