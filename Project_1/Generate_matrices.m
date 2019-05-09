function [A] = Generate_matrices(n)

if rem(n, 3) ~= 0
    disp('It should be the multiple of three!!!')
    return
end

p = n / 3;
A = [];

for h = 1 : 3
    A_row = [];
    for i = 1 : 3
        A_block = [];
        if h == i
            D = diag(randi([1, 100], 1, p));
            U = orth(randi([1, 100], p, p));
            A_block = U' * D * U;
            
        end
        if abs(h - i) == 1
            A_block = eye(p);
        end
        if abs(h - i) == 2
            A_block = zeros(p);
        end
        A_row = [A_row, A_block];
    end
    A = [A; A_row];
end

end

        
            

            
        
    

