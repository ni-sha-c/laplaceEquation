%function driverfun
% I removed the "function" part of the driver routine. Typing "driverfun"
% in matlab will work the same as how you have it; however, all of the
% variables below will be global and viewable after it has been run.
%
% I like to start all of my matlab programs with the following:
 close all; clear;
    a=5;
    b=4;
    N = 64;
    
    dtheta = 2*pi/N;

    theta = 0:dtheta:2*pi;
%
% you've included both theta=0 and theta=2 pi - because of periodicity,
% these will represent the same point. So, the first thing to try would be
% theta=0:dtheta:2*pi-dth and reduce the dimensions of your arrays to N
% instead of N+1. Your final system size should be N \times N, i.e. N
% unknowns
    boundaryPoints = z(theta,a,b);
    
    boundaryValues = f(N,boundaryPoints);
%
% you might wish to define a function, uexact(z), which will return the 
% value of your test function at a point or an array. I'll do an inline
% function here (or you could put it in a separate file):
    z_out = 10 + 10*1i;
    uexact = inline('log(abs(z-z_out))','z','z_out')
%
% and now you could simply say 
%   boundaryValues = uexact(boundaryPoints,z_out)
%
% now calling 
    differential = D(theta,a,b);
    mu = densityFunction(N,boundaryValues,boundaryPoints,differential);
%
% I probably would have put the bulk of this function in the driver
% routine - again, it makes it a bit easier to debug.
    
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
 %
 % you'll notice that in your answer, you have a slight imaginary 
 % component - I believe that is because you're adding one too many points
    disp(['Exact solution at z_o is:',num2str(uexact(z_o,z_out))]);
    err = abs(u_z_o-uexact(z_o,z_out));
    disp(['Error = ',num2str(err)])
%end