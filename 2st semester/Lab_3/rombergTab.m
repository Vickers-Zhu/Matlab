function r = rombergTab(f,a,b,m0,k)
% Romberg method
%    f,a,b -- function and the interval endpoints
%       m0 -- starting number of subintervals (must be greater than 0)
%        k -- Romberg table size
%        r -- diagonal of the Romberg table

% WUT 2019 | Numerical Methods II | An example | Pawel Keller

% Calculating trapezoidal rules...
r(k+1,1) = 0;
m = m0;
r(1) = trap(f,a,b,m);
for i = 1:k
    r(i+1) = (r(i) + rect(f,a,b,m)) / 2;
    m = 2*m;
end

% Extrapolation...
m = 4;
for i = 1:k
    for j = k+1:-1:i+1
        r(j) = (m*r(j) - r(j-1))/(m-1);
    end
    m = 4*m;
end
