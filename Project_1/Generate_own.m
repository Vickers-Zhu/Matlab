function [A] = Generate_own(n)

i = 0;
while 1
    i = i + 1;
    disp(i);
    if n == 3^i       
        break
    end
    if n > 3^i
        continue
    end
    if n < 3^i
        disp('n must be the the result of power of 3. Like 3^1 = 1, 3^2 = 9, 3^3 = 27');
        return
    end
end

A = Generate_rec(i);

end

function [A] = Generate_rec(i)

A = [];

if i == 1
    for j = 1:3
        A_row = [];
        for k = 1:3
            if j == k
                A_row = [A_row, randi(100)];
            end
            if abs(j - k) == 1
                A_row = [A_row, 1];
            end
            if abs(j - k) == 2
                A_row = [A_row, 0];
            end
        end
        A = [A; A_row];
    end
    return
end

for j = 1 : 3
    A_row = [];
    for k = 1 : 3
        if j == k
            A_row = [A_row, Generate_rec(i-1)];
        end
        if abs(j - k) == 1
            A_row = [A_row, eye(3^(i-1))];
        end
        if abs(j - k) == 2
            A_row = [A_row, zeros(3^(i-1))];
        end
    end
    A = [A; A_row];
end

end

