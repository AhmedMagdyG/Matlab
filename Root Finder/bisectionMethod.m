function [xxl, xxu, xxr, err, fxxr, flag]  = bisectionMethod(f, l, u, eps, maxI)
    it = 1;
    fl = f(l);
    fu = f(u);
    flag = 0;
    xr = 0;
    xxu = zeros(maxI);
    xxl = zeros(maxI);
    xxr = zeros(maxI);
    err = zeros(maxI);
    fxxr = zeros(maxI);
    %maxI = ceil(log2(abs(u-l) / eps));
    while it <= maxI
        if (fu * fl > 0)
            flag = 1;
            break;
        end
        xrOld = xr;
        xr = (l+u)/2;
        xxu(it) = u;
        xxl(it) = l;
        xxr(it) = xr;
        err(it) = abs(xr-xrOld);
        fr = f(xr);
        fxxr(it) = fr;
        test = fr * fl;
        if(test > 0)
            l = xr;
            fl = fr;
        end
        if(test < 0)
            u = xr;
            fu = fr;
        end
        if(test == 0)
            break;
        end
        if(err(it) <= eps && it > 1)
            break;
        end
        it = it+1;
    end
    if (it <= maxI)
        xxu = xxu(1:it);
        xxl = xxl(1:it);
        xxr = xxr(1:it);
        err = err(1:it);
        fxxr = fxxr(1:it);
    end
    return;
end

