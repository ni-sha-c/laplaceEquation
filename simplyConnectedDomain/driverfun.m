 close all; clear;
    a=5;
    b=4;
    N = 256;
    
    dtheta = 2*pi/N;

    theta = 0:dtheta:2*pi - dtheta;
    boundaryPoints = z(theta,a,b);
    
   
    z_out = 10 + 10*1i;
    uexact = inline('log(abs(z-z_out))','z','z_out');
    boundaryValues = uexact(boundaryPoints, z_out);
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
    z_o = 1+1i;
    u_z_o = cauchyInterior(N,mu,1+1i,boundaryPoints,differential);
    disp('value of function calculated at z_o is:');
    disp(u_z_o);
    disp(['Exact solution at z_o is:',num2str(uexact(z_o,z_out))]);
    err = abs(u_z_o-uexact(z_o,z_out));
    disp(['Error = ',num2str(err)])
