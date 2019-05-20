%% точка запуску програми
%% Варіант 3
%% Схрещування: цеклове
%% Мутація: золотого перетину

% Задача: знайти найвигідніший маршрут,
% який проходить через кожне місто по одному разу

% одною особою є послідовність обходу міст
% значення генів не можуть повторюватися
% а довжина хромосоми рівна кількості міст

% для матриці з 5 міст можливо всього 5! = 120 різних способів обходу
% тому розмір популяції візьмемо рівний кількості міст (5)

startPopulation = [
    1, 2, 3, 4, 5;
    2, 3, 4, 5, 1;
    3, 4, 5, 1, 2;
    4, 5, 1, 2, 3;
    5, 1, 2, 3, 4
];

options = gaoptimset(...
    'EliteCount', 0, ...
    'PopulationSize', 5, ...
    'InitialPopulation', startPopulation, ...
    'MutationFcn', @MutationFcn, ...
    'CrossoverFcn', @CrossoverFcn, ...
    'TimeLimit', 3 ...
);


[x,fval,exitflag,output,population,scores] = ga(@optim_function, 5, options);

disp('Найращей потомок:'); disp(x);
fprintf('f(x) = %d\n', fval);

disp('Остання популяція:');
for i=1:1:5
    for j=1:1:5
        fprintf('\t%d', population(i,j));
    end;
    fprintf('\t=>\t%d\n', scores(i));
end;

