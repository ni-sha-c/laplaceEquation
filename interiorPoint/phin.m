function res = phin(N)
        
    %define ellipse
    a = 5;
    b = 4;
    
    
    %define z_o
    z_o = 1 + 1*1i;
    
    %define z
    function res = z(theta)
            res = a*cos(theta) + 1i*b*sin(theta);
    end
    
    %define phi
    function res = phi(theta)
            res = z(theta)*z(theta);
    end
    
    %define D = d/d(theta) (z) 
    function res = D(theta)
            res = -a*sin(theta) + 1i*b*cos(theta);
    end

    phin = 0.0 + 1i*0.0;
    dtheta = 2*pi/N;
    
    %evaluation of Cauchy Integral
    for k = 1:N
        theta = dtheta*(k-1);
        phin = phin + 1/(2*pi*1i)*dtheta*phi(theta)*D(theta)/(z(theta) - z_o);
    end
    
    disp('Cauchy integral evaluated numerically, with');
    disp(N);
    disp('points is : ');
    disp(phin);
    
    res = phin;
end
        
    
    
    