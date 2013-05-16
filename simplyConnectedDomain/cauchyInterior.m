function res = cauchyInterior(N,mu,z_o,p,d)
        
    dtheta = 2*pi/N;
    %evaluation of Cauchy Integral
   
    res = real(sum(1/(2*pi*1i)*dtheta*(mu'.*d)./(p - z_o)));
end