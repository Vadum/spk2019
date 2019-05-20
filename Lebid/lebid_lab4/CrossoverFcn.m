function [ xoverKids ] = CrossoverFcn( parents, options, nvars, FitnessFcn, ...
    unused,thisPopulation ) 
% parents - індекси батьків в поточній популяції, що беруть участь у
%           схрещуванні. вектор з парною кількістю елементів
% nvars   - кількість змінних (генів)
% unused  - вектор-стовбець із оцінкою кожної особини
% thisPopulation - поточна популяція (матриця)

ret = zeros(length(parents)/2, nvars);
for i = 1:2:length(parents) 
    p1 = thisPopulation(i, :);
    p2 = thisPopulation(i+1, :);
    
    c = thisPopulation(i, :);
    for j = 1:1:nvars
        p1_bit = toBitArr(p1(j)+10);
        p2_bit = toBitArr(p2(j)+10);
        
        c_bit = [p1_bit(1:3), p2_bit(4:6)];
        c(j) = bi2de(c_bit)-10;
    end
    ret((i+1)/2,:) = c;  
end;

xoverKids = ret;

end

function [bitVal] = toBitArr(decVal)
    if decVal > 63
        dm = de2bi(decVal);
        dm = dm(1:6);          %відтинаємо лишні біти
    else
        dm = de2bi(decVal, 6);
    end  
    bitVal = dm;
end
