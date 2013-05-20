function curv = kappa(theta,a,b)
    curv = b*b*(cos(theta).^2) + a*a*(sin(theta).^2);
    curv = curv.^(1.5);
    curv = curv/(a*b);
    curv = curv.^-1;
end