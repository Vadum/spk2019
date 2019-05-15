function [ ret_fun ] = ga_static( func, nvars, k)

%% Повертає статистику пошуку оптимуму для вказаної функції %%

RANGE = [-50; 50];
POPULATION = 20;
GENERATIONS = 100;
F(1) = {@ga_var1};
F(2) = {@ga_var2};
N = 10;      % кількість повторних запусків функції

for var = 1:1:2
    time = []; fval = [];
    ga_var = F{var}; 
    for i = 1:1:N
        [ time_ret, fval_ret ] = ga_var( func, nvars, RANGE, POPULATION, GENERATIONS);
        time(i) = time_ret;
        fval(i) = fval_ret;
    end; 
    
    % час виконання, середнє значення, мінімальне значення, похибка %
    ret_fun(1, var) = roundn(mean(time), -4);
    ret_fun(2, var) = k*roundn(mean(fval), -4);
    ret_fun(3, var) = k*roundn(min(fval), -4);
    ret_fun(4, var) = abs((ret_fun(2, var) - ret_fun(3, var))/...
                        ret_fun(3, var))*100;
end;


end

