function res = fn(N)
       
    %define ellipse
    a = 4;
    b = 5;
    
    %define phi
    function res = phi(theta)
            res = 1;
    end
    
    %define z 
    function res = z(theta)
            res = a*cos(theta) + 1i*b*sin(theta);
    end
    
    %define D = d/d(theta) (z) 
    function res = D(theta)
            res = -a*sin(theta) + 1i*b*cos(theta);
    end

    dtheta = 2*pi/N;
    theta = 0:dtheta:2*pi;
    theta_o = theta(1:2:N+1);
    theta_e = theta(2:2:N+1);
    p = z(theta);
    %p_o = z(theta_o);
    %p_e = z(theta_e);
    
    
    %evaluating function at the boundary
    %Using alternating trapezoid rule
    
    A = repmat(p,N+1,1);
    B = repmat(p.',1,N+1);
    
    
    A = A-B;
    
       
    
    C_e = A(2:2:N+1, 1:2:N+1);
    C_o = A(1:2:N+1, 2:2:N+1);
    
    
    term_o = phi(theta_o).*D(theta_o);
    term_e = phi(theta_e).*D(theta_e);
    
    term_o = term_o*dtheta*1/(pi*1i);
    term_e = term_e*dtheta*1/(pi*1i);
    
    term_o = repmat(term_o,size(C_e,1),1);
    term_e = repmat(term_e,size(C_o,1),1);
    
    f_e = term_o./C_e;
    f_o = term_e./C_o;
    
    f_e = sum(f_e,2);
    f_e = f_e.';
    f_o = sum(f_o,2);
    f_o = f_o.';
    
    res(1:2:N+1) = f_o;
    res(2:2:N+1) = f_e;
    
    disp('result is:');
    disp(res);
end
    
    
    
    
    
    
    
    
    
    
    