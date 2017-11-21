function [n, method, equ, acc, iter, initial, errFlag, errMessage] = readEquations(fileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
errFlag = 0;
initial = {};
iter = '';
acc = '';
equ = {};
method = '';
errMessage = '';
n = '';
fileID = fopen(fileName,'r');
if (fileID == -1)
   errFlag = 1;
   errMessage = 'Couldn"t open the file';
   return
end
n = strtrim(fgets(fileID));
if (isempty(n) || isnan(str2double(n)))
   errFlag = 1;
   errMessage = 'Number of equations not a number !';
   return
end
temp = str2double(n);
if (floor(temp) ~= temp || temp < 0)
   errFlag = 1;
   errMessage = 'Invalid number of equations';
   return
end
method = strtrim(fgets(fileID));
if (isempty(method))
    errFlag = 1;
    errMessage = 'No method specified';
    return;
end
method = strtrim(method);
equ = cell(temp,1);
initial = cell(temp, 1);
for i = 1:temp
    equ{i} = strtrim(fgets(fileID));
    if (isempty(equ{i}))
        errFlag = 1;
        errMessage = 'Invalid equation specified';
        return;
    end
end
if (strcmpi(method, 'All methods') || strcmpi(method, 'Gauss-Seidel'))
    for i = 1:temp
        initial{i} = str2double((fgets(fileID)));
        if (isnan(initial{i}))
            errFlag = 1;
            errMessage = 'Invalid inital value specified';
            return;
        end
    end 
    acc = strtrim(fgets(fileID));
    if (isnan(str2double(acc)))
        errFlag = 1;
        errMessage = 'Invalid or no epsilon specified.';
        return;
    end
    iter = strtrim(fgets(fileID));
    if (isnan(str2double(iter)) || floor(str2double(iter)) ~= str2double(iter))
        errFlag = 1;
        errMessage = 'Invalid or no max iterations specified';
        return;
    end
elseif (~(strcmpi(method, 'Gaussian-elimination') || strcmpi(method, 'LU decomposition') || strcmpi(method, 'Gaussian-Jordan')))
    errFlag = 1;
    errMessage = 'Invalid method specified.';
    return;
end
fclose(fileID);
end

