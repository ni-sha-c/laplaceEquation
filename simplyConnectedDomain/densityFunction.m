function res = densityFunction(N,f,p,D)      
  
    %Using alternating trapezoid rule
    
    A = repmat(p,N+1,1);
    B = repmat(p.',1,N+1);
    
    %A contains the terms z_j - z_i where i = row number and j= column
    %number
    A = A-B;
   
    %C contains D(z_j) where j is the column number. This row vector is
    %repeated N+1 times
    C = repmat(D, N+1 , 1);
    
    %term contains (z_j - z_i)/D(z_j). Inverse of what we need to avoid
    %division by 0.
    term = A./C;
    
    %multiplying by i*N. This will go to the denominator on taking the
    %reciprocal
    term = 1i*N*term;
        
    %Making diagonal terms 1 to suit the equation
    term = term + eye(N+1);
    
    %taking reciprocal of  matrix
    term = term.^-1;
    
    %Because of the alternating trapezoidal rule some of the terms will be
    %zero
    term(1:2:N+1,1:2:N+1) = 0;
    term(2:2:N+1,2:2:N+1) = 0;
    term = term + eye(N+1);
    
    %taking real part of matrix
    exp = real(term);
    
    res = exp\(2*f');
    
    %disp('The density function is: ');
    %disp(res);
end
    
    
    
    
       
    

    
  
    
   