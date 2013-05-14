function spectralaccuracy
    y = [];
    x = [];
    phi = 0.5;
    
    for k = 1:10
        N = 2^k;
        phin = fn(N);
        err = phi - phin(1);
        err = abs(err);
        y = [y , err];
        x = [x, N];
    end
    loglog(x,y);
end