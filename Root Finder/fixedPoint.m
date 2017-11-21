function [xs, err, fxxr] = fixedPoint (f, g, xi, eps, maxI )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    it = 2;
    xs = zeros(maxI);
    err = zeros(maxI);
    fxxr = zeros(maxI);
    xs(1) = xi;
    err(1) = 0;
    fxxr(1) = f(xi);
    while it <= maxI;
        xOld = xi;
        xi = g(xi);
        xs(it) = xi;
        fxxr(it) = f(xi);
        err(it) = abs(xi-xOld);
        if(err(it) <= eps && it > 1)
            break;
        end
        it = it+1;
    end
    if (it <= maxI)
        xs = xs(1:it);
        err = err(1:it);
        fxxr = fxxr(1:it);
    end
    return;
end

