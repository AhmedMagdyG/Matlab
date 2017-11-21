function [method, equ, acc, iter, in1, in2, in3, in4, errFlag, errMessage] = readEquationFile(fileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
errFlag = 0;
in1 = '';
in2 = '';
in3 = '';
in4 = '';
iter = '';
acc = '';
equ = '';
method = '';
errMessage = '';
fileID = fopen(fileName,'r');
if (fileID == -1)
   errFlag = 1;
   errMessage = 'Couldn"t open the file';
   return
end
method = strtrim(fgets(fileID));
if (isempty(method))
    errFlag = 1;
    errMessage = 'No method specified';
    return;
end
method = strtrim(method);
equ = strtrim(fgets(fileID));
if (isempty(equ))
    errFlag = 1;
    errMessage = 'No equation specified';
    return;
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
if (strcmpi(method, 'bisection'))
    in1 = strtrim(fgets(fileID));
    in2 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)) || isnan(str2double(in2)))
        errFlag = 1;
        errMessage = 'Invalid parameters for bisection specified';
        return;
    end
elseif (strcmpi(method, 'false-position'))
    in1 = strtrim(fgets(fileID));
    in2 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)) || isnan(str2double(in2)))
        errFlag = 1;
        errMessage = 'Invalid parameters for false-position specified';
        return;
    end
elseif (strcmpi(method, 'fixed point'))
    in1 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)))
        errFlag = 1;
        errMessage = 'Invalid parameters for fixed point specified';
        return;
    end
elseif (strcmpi(method, 'newton-raphson'))
    in1 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)))
        errFlag = 1;
        errMessage = 'Invalid parameters for newton-raphson specified';
        return;
    end
elseif (strcmpi(method, 'bierge-vieta'))
    in1 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)))
        errFlag = 1;
        errMessage = 'Invalid parameters for bierge-vieta specified';
        return;
    end
elseif (strcmpi(method, 'secant'))
    in1 = strtrim(fgets(fileID));
    in2 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)) || isnan(str2double(in2)))
        errFlag = 1;
        errMessage = 'Invalid parameters for secant specified';
        return;
    end
elseif (strcmpi(method, 'all methodes'))
    in1 = strtrim(fgets(fileID));
    in2 = strtrim(fgets(fileID));
    in3 = strtrim(fgets(fileID));
    in4 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)) || isnan(str2double(in2)) || isnan(str2double(in3)) || isnan(str2double(in4)))
        errFlag = 1;
        errMessage = 'Invalid parameters for all methodes specified';
        return;
    end
elseif (strcmpi(method, 'general'))
    in1 = strtrim(fgets(fileID));
    in2 = strtrim(fgets(fileID));
    if (isnan(str2double(in1)) || isnan(str2double(in2)))
        errFlag = 1;
        errMessage = 'Invalid parameters for general method specified';
        return;
    end
else
    errFlag = 1;
    errMessage = 'Undefined method';
    return;
end
fclose(fileID);
end

