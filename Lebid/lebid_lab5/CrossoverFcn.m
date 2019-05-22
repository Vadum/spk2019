function [xoverKids] = CrossoverFcn( parents, options, nvars, FitnessFcn, ...
    unused,thisPopulation )
%% Реалізація функції для схрещування потомків (циклове схрещування)

% parents - індекси батьків в поточній популяції, що беруть участь у
%           схрещуванні. вектор з парною кількістю елементів
% nvars   - кількість змінних (генів)
% unused  - вектор-стовбець із оцінкою кожної особини
% thisPopulation - поточна популяція (матриця)
ret = zeros(length(parents)/2, nvars);

for i = 1:2:length(parents)-1 
    p1 = thisPopulation(parents(i), :);
    p2 = thisPopulation(parents(i+1), :);
    
    % генеруємо цикл
    t = randi(nvars);     % початок циклу (індекс)
    cycle = zeros(1,nvars);
    for j = 1:1:nvars  
        cycle(1,j) = t;
        nv = p2(t);
        t = find(p1==nv);
        if (p1(cycle(1,1)) == nv) 
            break;  % цикл замкнувся
        end;
    end;
    
    % елементи, що не попали в цикл успадковуються від іншого батька
    child = p2;
    for j = 1:1:nvars
        if (cycle(1,j) ~= 0)
            child(1,cycle(1,j)) = p1(cycle(1,j));
        end;
    end;
    ret((i+1)/2,:) = child;  
end;

xoverKids = ret;
end

