% MENU 

finish=3;  
kontrol=1;
OK=0;

format long e
while kontrol~=finish,
    kontrol=menu('My first menu','Matrix A =   ','det(A)', 'FINISH');
    switch kontrol
        case 1
            OK=1;
            A=input('A =         ')
        case 2
            if OK disp('det(A)=   '),disp(det(A)) 
            else disp('A=?')
            end
         
        case 3
            disp('FINISH')
    end
end