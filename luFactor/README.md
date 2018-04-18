# luFactor
***
## Description
luFactor is a Matlab program that determines the L-U factorization of a square matrix with pivoting. luFactor tracks the L matrix, U matrix, and P or pivot matrix.

## Inputs
luFactor takes one input.
1. A the square matrix whose lu factorization is to be found

## Outputs
luFactor gives 3 outputs.
1. L is the lower triangular matrix.
2. U is the upper triangular matrix.
3. P is the pivot matrix.

## Checks
luFactor has two checks and associated messages.
1. Checks if one inputs is given and throws error if not.
2. Checks if A is a square matrix and throws error if not. 

##Known Bugs
Currently luFactor only works for a 3x3 matrix. luFactor find the larger of two pivot elements, rather than the maximum of all the potential pivot elements. 
