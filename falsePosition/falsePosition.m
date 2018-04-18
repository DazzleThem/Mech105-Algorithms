function [root,fx,ea,iter] = falsePosition(Func,xl,xu,es,maxiter)
%This function estimates the location of a root of a function using the false position
%formula. For higher order  functions, you will need 10,000+ iterations to
%be accurate. 
%Inputs 5 (2 default)
    %Func = function being evaluated
    %xl = lower guess
    %xu = larger guess
    %es = relative error. Defaults to 0.0001%
    %maxiter = number of iterations desired. Defaults to 200
%Outputs 4
    %root = coordinates of the estimated root
    %fx = function evaluated at the root
    %ea = approximate relative error
    %iter = number of iteration performed
    
 
    %The subsequent loops ensure the minimum number of inputs is met and sets defaults. 
    %Note that all the loops have to be separate because need each one to run each
    %time.
 
    if isempty(Func) || isempty(xl) || isempty(xu) %check if user input 3 non-default vars
        error ('Vales for Func, xl, and xu are required') %if fewer than 3, need 3
    end
    
    if isempty(es) %check if there is an input for es
        es=0.0001 %if not, set default value
    end
    if isempty(maxiter) %check if is input for iter
        iter=200 %if not, set iter to default
    end
    
    %This loops makes sure a zero exists within the chosen bracket. If both
    %values are negative or both are positive, there is no sign change and
    %no root. 
    if Func(xl)*Func(xu)>0
        error ('There is no root between the brackets. Pick brackets such that the function changes sign over the interval.')
    end
    ea=2*es; %Define ea and ensure loop runs at least once.
    iter=0; %Initialize iter
    xr=xl; %Initialize xr
    
    while ea>es && iter<maxiter %Loop will run until the approximate error falls below the relative error threshold or iter reaches maxiter.
        xrold=xr; %set xrold for ea calclation on line 47
        xr=xu-(Func(xu)*(xl-xu)/(Func(xl)-Func(xu))); %formula for a new estimation by false position method. 
        if xr~=0 %xr is in the denominator, so if it's zero, we skip calculating ea
            ea=abs(((xr-xrold)/xr))*100; %calculating the approximate relative error
        end
        iter=iter+1; %counting iterations
        if Func(xr)*Func(xu)>0; %if the new has a same sign from the old upper estimate
            xu=xr; %then xr takes place of xu
        else
            xl=xr; %otherwise xr takes place of xl
            
           
        end
        
   end
   root=xr; %These are suppressed because calling the function will print the outputs.
   fx=Func(xr);  

end

