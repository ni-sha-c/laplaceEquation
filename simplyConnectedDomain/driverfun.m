function driverfun
    a=5;
    b=4;
    N = 64;
    
    dtheta = 2*pi/N;
    
    theta = 0:dtheta:2*pi;
    boundaryPoints = z(theta,a,b);
    
    boundaryValues = f(N,boundaryPoints);
    differential = D(theta,a,b);
    mu = densityFunction(N,boundaryValues,boundaryPoints,differential);
    
    disp('The density function is: ');
    disp(mu);
    
    %checking
    disp('Boundary values specified: ');
    disp(boundaryValues);
    disp('Boundary values calculated: ');
    bv_from_nm = cauchyBoundary(N,mu,boundaryPoints,differential);
    disp(bv_from_nm);
    %finding u at interior point
    u_z_o = cauchyInterior(N,mu,1+1i,boundaryPoints,differential);
    disp('value of function calculated at z_o is:');
    disp(u_z_o);
end