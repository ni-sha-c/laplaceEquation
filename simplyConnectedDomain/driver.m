function driver
    a=5;
    b=4;
    N = 64;
    
    dtheta = 2*pi/N;
    
    theta = 0:dtheta:2*pi;
    boundaryPoints = z(theta,a,b);
    
    boundaryValues = f(N,boundaryPoints);
    
    mu = densityFunction(N,boundaryValues,boundaryPoints,a,b);
    
    disp('The density function is: ');
    disp(mu);
end