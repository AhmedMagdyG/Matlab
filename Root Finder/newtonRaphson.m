function [ xs, err, fxs, dfxs, flag, message] = newtonRaphson(f,dF,xi,eps,maxI)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes heref
    it = 1;
    xs = zeros(maxI);
    err = zeros(maxI);
    fxs = zeros(maxI);
    dfxs = zeros(maxI);
    flag = 0;
    message = '';
    xOld = xi;
    while it <= maxI;
        fxs(it) = f(xi);
        dfxs(it) = dF(xi);
        xs(it) = xi;
        err(it) = abs(xi-xOld);
        if(abs(dfxs(it)) < 1E-8)
            flag = 1;
            message = 'Division by zero!';
            it = it+1;
            break;
        end;
        if(err(it) <= eps && it > 1)
            break;
        end;
        xOld = xi;
        xi = xi - fxs(it)/dfxs(it);
        it = it+1;
    end;
    if (it <= maxI)
        xs = xs(1:it);
        fxs = fxs(1:it);
        dfxs = dfxs(1:it);
        err = err(1:it);
    end
    return;

end

