function [  mutationChildren ] = MutationFcn( parents, options, nvars, ...
FitnessFcn, state, thisScore, thisPopulation )
%% Функція мутації. Міняє місцями 2 випадкові гени

% parents - номер особини в популяції, що мутує
% nvars - кількість змінних
% state - інформація про поточну популяцію
% thisScore - оцінки поточної популяції
% thisPopulation - поточна популяція

 t1 = randi(nvars);
 t2 = randi(nvars);
 
 while t1 == t2
     t2 = randi(nvars);
 end;

 mutant = thisPopulation(parents, :);
 d1 = mutant(t1);
 d2 = mutant(t2);
 
 mutant(t1) = d2;
 mutant(t2) = d1;
 
 mutationChildren = mutant;
 
end

