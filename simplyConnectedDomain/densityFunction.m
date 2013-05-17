function [res,A] = densityFunction(N,f,p,normal)      
  
    
    dtheta = 2*pi/N;    
    %Using Gradient Quadrature
    
    A = repmat(p,N,1);
    B = repmat(p.',1,N);
    
    %A contains the terms z_j - z_i where i = row number and j= column
    %number
    A = A-B;
   
    %C contains |z_j - z_i|^2 
    C = abs(A);
    C = C.^2;
    C = C + eye(N);
    
    %gives complex conjugate transpose of normal
    normal = repmat(normal,N,1);
    normal = normal';
    %gives complex conjugate of normal
    normal = normal.';
    
    %finding (z_j - z_i).normal@z_j
    A = real(A.*normal);
    h = dtheta/pi;
    A = h*A./C;
    
    A = A + eye(N);
    %taking real part of matrix
    disp(['condition number of system matrix = ',num2str(cond(A))])
    
    res = A\(2*f');
    %disp('The density function is: ');
    %disp(res);
end
    
    
    
    
       
    

    
  
    
   
