function [ state,options,optchanged ] = OutputFcn( options,state,flag )
 global RET;
 ci = state.Generation;
 RET.generation = ci;
 key = strcat('s',num2str(ci)); 
 RET.population(:).(key) = state.Population;
 RET.fvals(:).(key) = state.Score;
 optchanged  = false;
end

