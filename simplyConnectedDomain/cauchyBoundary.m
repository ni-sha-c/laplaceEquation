function res = cauchyBoundary(N,mu,p,d)
    odd = 1:2:N+1;
    even = 2:2:N+1;
    dtheta = 2*pi/N;
       
    %evaluating function at the boundary
    %Using alternating trapezoid rule
    
    A = repmat(p,N+1,1);
    B = repmat(p.',1,N+1);
    
    
    A = A-B;
    
       
    
    C_e = A(2:2:N+1, 1:2:N+1);
    C_o = A(1:2:N+1, 2:2:N+1);
    
    
    term_o = (mu(odd))'.*d(odd);
    term_e = (mu(even))'.*d(even);
    
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
    
    res = res - (mu')/2;
       
end
