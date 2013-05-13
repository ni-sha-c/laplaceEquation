function spectralaccuracy(z_o)
    y = [];
    x = [];
    phi = z_o*z_o;
    disp(phi);
    for k = 1:10
        N = 2^k;
        err = phi - phin(N);
        err = abs(err);
        y = [y , err];
        x = [x, N];
    end
    plot(x,y);
end
        
        