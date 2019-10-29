format compact

niter = 100;

x = linspace(-2.1, 0.6, 1351);
y = linspace(-1.2, 1.2, 1201);

[X, Y] = meshgrid(x, y);

c = complex(X, Y);

z = zeros(size(c));
k = zeros(size(C));

for i = 1 : niter
    z = z.^2 + c;
    k(abs(z) > 1000 & k == 0) = niter - i;
end

imagesc(k);
