# falsePosition
***
## Description
falsePosition is a Matlab program that estimates the location of the roots of a given mathematical function using the false position formula.
falsePosition requires two inital guesses at the location of the root to produce a third guess, then chooses one of the two previous guesses to use with the third to proudce a fourth. falsePosition is a for loop that tracks both approximate error and the number of iterations performed. falsePosition will run unti a target value of error is achieved or a given number of iterations has passed.

## Inputs
falsePosition has 5 inputs, 2 of which have defaults
1. Func is the anonymously defined function being evaluated.
2. xl is the smaller-valued guess of root location.
3. xu is the larger-valued guess of root location.
4. es is the target relative error after which the program will stop. Defaults to 0.0001%.
5. iter is the maximum number of iterations performed. Defaults to 200.

## Outputs
falsePosition has four outputs.
1. root is the horizontal coordinate of the estimated root.
2. fx is the function evaluated at root.
3. ea is the approximated relative error of root.
4. iter is the number of iterations perfored to get root. 

## Checks
falsePosition performs three checks with associated actions.
1. falsePosition checks if the three non-default inputs were given and throws an error if not. 
2. falsePosition checks if a value for ea was given and sets ea to default if not.
3. falsePosition chekcs if a value for iter was given and sets iter to default if not. 
___

## Usage Notes
The functions whose roots are to be found (func) must be anonymously defined. Have a separate script for calling falsePosition that anonymously defines func.
