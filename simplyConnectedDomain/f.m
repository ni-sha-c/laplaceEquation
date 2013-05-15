function res = f(N,z)
    %Some point outside domain
    z_out = 10 + 10*1i;
    %define function here
    z_s = repmat(z_out,1,N+1);
    
    res = log(abs(z-z_s));
end