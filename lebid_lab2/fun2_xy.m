function [ fxy ] = fun2_xy( xy )
x = xy(:,1);
y = xy(:,2);
fxy = (y-3).*exp(-x.^2 -y.^2);
end

