function main()  
 [names, x, y] = textread('cities.csv', '%s %d %d', 'delimiter', ',');
 global WAY_MATRIX;
 WAY_MATRIX = getWayMatrix(x, y, 1000);

 population_size = ceil(length(x)^(1/2));  % до більшого цілого
 elite_count = floor(0.3*population_size);
 nvars = length(x);
  
 global RET;
 RET = struct('generation', 0, 'population', struct, 'fvals', struct);
 
 options = gaoptimset(...
    'CreationFcn', @CreationFcn, ...
    'PopulationSize', population_size, ...
    'EliteCount', elite_count, ...
    'MutationFcn', @MutationFcn, ...
    'CrossoverFcn', @CrossoverFcn, ...
    'OutputFcns', {@OutputFcn}, ...
    'SelectionFcn', @selectionroulette, ...
    'PlotFcns', {@gaplotbestf, @gaplotdistance} ...
 );
 
 [xval,fval,exitflag,output,population,scores] = ga(@FitnessFcn, nvars, options);

 % графічне представлення шляху
 XX = x; YY = y; NNames = names;
 for i = 1:1:nvars
    XX(i) = x(xval(i));
    YY(i) = y(xval(i));
    NNames(i) = names(xval(i));
 end
 XR = [XX(nvars), XX(1)];
 YR = [YY(nvars), YY(1)];
 
 figure
 plot(XX, YY, '-*', XR, YR, '--')
 text(XX+1,YY+1,NNames)
 
 % вивід результатів
 disp('Початкова популяція:');
 PrintIter(RET.population.s0, RET.fvals.s0, nvars, population_size);
 disp('Покоління 1:');
 PrintIter(RET.population.s1, RET.fvals.s1, nvars, population_size);
 disp('Покоління 2:');
 PrintIter(RET.population.s2, RET.fvals.s2, nvars, population_size);

 disp('Результат:');
 PrintIter(population, scores, nvars, population_size);
 fprintf('Best:\n');
 PrintOne(xval, fval, nvars);
 PrintOneStr(NNames, fval, nvars);

end

function way_matrix = getWayMatrix(X, Y, M)
%% Формує матрицю з відстаннями між кожним містом
ret = zeros(length(Y), length(X));
for i = 1:1:length(Y)
    for j = 1:1:length(X)
        if (i == j)
            ret(i,j) = M;
        else
             v = ((X(i) - X(j)).^2 + (Y(i)-Y(j)).^2).^(1/2);
             ret(i,j) = v;
        end
    end
end
way_matrix = ret;
end

function PrintIter(curp, fval, nvars, psize)
    % функція для виводу популяції 
    for i = 1:1:psize
       PrintOne(curp(i,:), fval(i), nvars);
    end;
    fprintf('\n');
end

function PrintOne(x, fval, nvars)
    fprintf('[');
    for j=1:1:nvars
        fprintf('%3d, ', x(j));
    end;
    fprintf('] => %.2f\n', fval);
end

function PrintOneStr(x, fval, nvars)
    fprintf('[');
    for j=1:1:nvars
        fprintf('%3s, ', char(x(j)));
    end;
    fprintf('] => %.2f\n', fval);
end