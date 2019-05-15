function [ fxy ] = fun4_xy( xy )
x = xy(:,1);
y = xy(:,2);
fxy = exp(-x.^2 - y.^2) + sin(x+y);

% обертаємо функцію
fxy = -1*fxy;
end

