Solution of Laplace equation over a simply connected domain for a Dirichlet Boundary Condition

* Main file : driverfun
(All parameters can be modified here)

* Known solution is log||(x,y) - (x_s - y_s)||

* Domain chosen is an ellipse with boundary L = (acos(theta),bsin(theta))

* Solution tested by evaluating cauchy integral using the density function that is found out, both on interior points and boundary points.

* Alternating Trapezoidal rule used both while calculating the density function and while calculating the Cauchy integral at the boundary to check the solution. 
