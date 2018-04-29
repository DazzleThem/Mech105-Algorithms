# Description
***
Heun is a matlab function that numerically solves a differential equation using Heun's method. Heun numerically solves differential equations using Heun's method. Heun iterates the corrector equation until either the stopping criterion is met or maxiter is reached. If the range over which the function is be be solved cannot be divided by h, Heun corrects the range downward so it is divisible by h. The reamining bit is also solved with Heun's method with a step size equal to the remainder. Heun displays a graph of the points.
## Inputs
Heun's inputs must be given in order. Heun has 6 inputs.
1.  dydt = the anonymously-defined differential equation to be solved.
2.  tspan = the vector containg two elements that dictate over what range dydt will be solved.
3.  y0 = the initial value of y at the first element of tspan. 
4.  h = step size.
5.  es = the percent error at which the function stops iterating the predictor-corrector and moves to the next step size. Defaults to 0.1%.
6. maxit = the number of iterations at which the function stops iterating the corrector and moves by h to the next point. Defaults to 50.

## Outputs
1.   t = the vector containing the horizontal values of the points.
2.   y = the vector containing the vertical values of the points.

## Checks
Heun has 4 checks and associates messages. 
1. Heun checks if fewer than four inputs were given. If so, Heun throws an error.
2. Heun checks if fewer than five inptus were given. If so, Heun sets es to its default.
3. Heun checks if fewer than six inputs were given. If so, Heun sets maxit to its default. 
4. Heun checks if tspan is divisible by h. If not, Heun throws a warning and evaluates the remainder separately. 
