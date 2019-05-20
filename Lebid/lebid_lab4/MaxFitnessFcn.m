function  [output_args] = MaxFitnessFcn( input_args )
output_args = (-1)*FitnessFcn( input_args );
end

