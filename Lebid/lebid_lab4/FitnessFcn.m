function  [output_args] = FitnessFcn( input_args )
% input_args = [x1]
% варіант 3
a = 10; b = -20; c = -40; d = 1;
x = input_args(1);

f = a + b*x + c*(x^2) + d*(x^3);
output_args = f;

end

