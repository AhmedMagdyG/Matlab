function [x] = Gaussian_Jordan(a, b)    
a = [a, b]; 
n = length(a);
for i = 1:n-1
    y = a(i,:);
    y = y/y(i);
    a(i,:) = y;
    for j = 1:n-1
        if (i~=j)
           a(j,:) = y * -1 * a(j,i) + a(j,:); 
        end   
    end
end
x = a(:,length(a))';
end
