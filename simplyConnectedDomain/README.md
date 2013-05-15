<h1>Solution of Laplace equation over a simply connected domain for a Dirichlet Boundary Condition</h1>

* Main file : <b>driverfun</b>
(All parameters can be modified here)

* Known solution is <h3>log||(x,y) - (x_s - y_s)||</h3>

* Domain chosen is an ellipse with boundary <h3>L = (acos(theta),bsin(theta))</h3>

* Solution tested by evaluating cauchy integral using the density function that is found out, both on interior points and boundary points.

* Alternating Trapezoidal rule used both while calculating the density function and while calculating the Cauchy integral at the boundary to check the solution. 
