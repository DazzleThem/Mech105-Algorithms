# Simpson
***
## Description
Simpson is a matlab function that numerically integrates a set of evenly spaced points. Simpson uses a combination of Composite Simpson's 1/3 rule and Trapezoid rule. Simpson uses the Composite Simpson's 1/3 rule on the largest number of even segments possible. If the number of segments in odd, Simpson uses Trapezoid rule on the last segment then adds the results from the two rules. 

## Inputs
Simpson requires two inputs, X and Y. 
X is the set of horizontal coordinates of the points.  
Y is the corresponding set of vertical coordinates of the points.

## Outputs
Simpson returns a single output, I.
I is the integral calculated by the program.

## Checks
Simpson has 4 checks and associated messages. 
1. Simpson checks if two inputs were given and, if not, throws an error.
2. Simpson checks if the given number of segments is odd. If so, Simpson throws a warning that Trapezid rule will be used.
3. Simpson checks that each point has both an x and a y coordinate and throws an error if one point does not. 
4. Simpson checks that the points are evenly spaced and throws an error if they are not. 
