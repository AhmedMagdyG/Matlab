function [ x ] = LuDecomposition( a, b )
%LUDECOMPOSITION Summary of this function goes here
%   Detailed explanation goes here
n = size(a, 1);
lu = a;
for i = 1 : n - 1
    for j = i + 1 : n
        factor = lu(j,i) / lu(i,i);
        lu(j,i:n) = lu(j,i:n) - factor .* lu(i,i:n);
        lu(j,i) = factor;
    end
end
y = zeros(n, 1);
% L Y = B
y(1) = b(1);
for i = 2 : n
    y(i) = b(i);
    for j = 1 : i - 1
        y(i) = y(i) - lu(i,j) *  y(j);
    end
end
% U X = Y
x(n) = y(n) / lu(n,n);
i = n - 1;
while (i > 0)
    x(i) = y(i);
    for j = i + 1 : n
        x(i) = x(i) - lu(i,j) * x(j);
    end
    x(i) = x(i) / lu(i,i);
    i = i - 1;
end

end

