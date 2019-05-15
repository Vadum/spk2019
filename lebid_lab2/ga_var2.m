function [ time, fval ] = ga_var2( func, nvars, range, population_size, generations )
    
options = gaoptimset();
options = gaoptimset(options, 'SelectionFcn', @selectionroulette);
options = gaoptimset(options, 'CrossoverFcn', @crossoverintermediate);
options = gaoptimset(options, 'MutationFcn', @mutationuniform);
options = gaoptimset(options, 'PopInitRange', range);
options = gaoptimset(options, 'Generations', generations);
options = gaoptimset(options, 'PopulationSize', population_size);

tic
[x, fval] = ga(func, nvars, options);
time = toc;

end