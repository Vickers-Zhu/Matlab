function[] = visualise(a, b, c, d, m, n, f, dfdx, dfdxs, eps)

h1 = (b - a)/n;
h2 = (d - c)/m;
A = zeros(n+1, m+1);

% f = @(x) x^4 - 1000 + 1/x;
% dfdx = @(x) 4 * x^3 - 1/x^2;
% dfdxs = @(x) 12 * x^2 + 2/x^3;


for k = 1 : n+1
    for j = 1 : m+1
        [solution, no_iterations] = Halley(f, dfdx, dfdxs, a+k*h1+(c+j*h2)*i, eps);
        if no_iterations > 0
            fprintf('Number of function calls: %d\n', 1 + 2*no_iterations);
            A(k, j) = 1 + 2*no_iterations;
            fprintf('A solution is: %f\n', solution)
        else
            fprintf('Abort execution.\n')   
        end
    end
end
imagesc(A);
colorbar;

end