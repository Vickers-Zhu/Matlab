function [r] = BlockChol(A,b)
%Block Cholesky function for specific matrix
%   Detailed explanation goes here
if  ~ismatrix(A)
    error("A should be a matrix")
end
if ~isvector(b)
    error("b should be a vector")
end
if rem(length(A),3) ~= 0
    error("Matrix should have proper number of rows")
end
if size(A,1) ~= size(b,1)
    error("Matrix and vector size is not equal")
end
%since Matlab cannot make matrices of matrices
% A(1,1) = B, A(2,2) = C, A(3,3) = D
% L(1,1) = E, L(2,1) = F, L(2,2) = G
% L(3,2) = H, L(3,3) = J 
% I - identity matrix p*p

n = size(A,1);
p = n/3;


B=A(1:p,1:p);
C=A(p+1:2*p,p+1:2*p);
D=A((2*p)+1:3*p,(2*p)+1:3*p);
I = eye(p);


E = CholDec(B);


F = inv(transpose(E)) * I;


S = C - (F * transpose(F));

G = CholDec(S);

H = inv(transpose(G)) * I;

S = D - (F * transpose(F));
J = CholDec(S);

%at this point we have our block Cholesky matrix
%[E 0 0]      [E' F' 0 ]
%[F G 0] = L  [0  G' H'] = L'
%[0 H J]      [0  0  J']

c = b(1:p);
d = b(p+1:2*p);
e = b((2*p)+1:3*p);
%     [c]      [x]      [f]
% b = [d]  x = [y]  m = [g]
%     [e]      [z]      [h]
% A * x = b
% A = L * L'
% L * L' * x = b
% L' * x = m
% L * m = b

f = E\c;
g = inv(G) * (d-(F*f));
h = inv(J) * (e - (H*g));


z = transpose(J)\h;
y = inv(transpose(G)) * (g -(transpose(H)*z));
x = inv(transpose(E)) * (f - (transpose(F)*y));

r=[x;y;z];
disp(r);
o = linsolve(A,b);
disp(o);
end

