function Population = CreationFcn( GenomeLength, FitnessFcn, options )
%% Функція для створення початкової популяції негомологічих особин

 ret = zeros(options.PopulationSize, GenomeLength);
 
 for i = 1:1:options.PopulationSize
     vars = 1:1:GenomeLength;
     for j = 1:1:GenomeLength
         t = randi(length(vars));
         ret(i,j) = vars(t);
         vars(t) = [];
     end;
 end;
 
 Population = ret;
 
end

