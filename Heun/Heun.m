function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%HEUN numerically solves differential equations using Heun's method. Heun
%iterates the corrector equation until either the stopping
%criterion is met or maxiter is reached. If the range over which the
%function is be be solved cannot be divided by h, Heun corrects the range
%downward so it is divisible by h. The reamining bit is also solved with
%Heun's method with a step size equal to the remainder. Heun displays a
%graph of the points.
% INPUTS 6, 2 default
%   dydt = the anonymously-defined differential equation to be solved
%   tspan = the vector containg two elements that dictate over what range
%           dydt will be solved
%   y0 = the initial condition
%   h = step size
%   es = the percent error at which the function stops iterating the 
%        predictor-corrector and moves to the next step size. Defaults to
%        0.1% or 0.001
%   maxit = the number of iterations at which the function stops iterating 
%           the corrector and moves by h to the next point. Defaults
%           to 50
% OUTPUTS 2
%   t = the vector containing the horizontal values of the points
%   y = the vector containing the vertical values of the points

if nargin<4 %check if at least 4 values given and error if not
    error ('Values for at least dydt, tspan, y0, and h are required.')
end

if nargin<5 %check if value given for es and default if not
    es=0.001;
end

if nargin<6 %check if value given for maxit and default if not
    maxit=50;
end

if length(tspan)~=2 %check if tspan has a start point and an end point and throw error if not
    error ('tspan must be a vector containing two variables that define the left point and right point of the domain over which the function will be solved.')
end
%This section checks if the range of tspan is divisible by the step size and redfines
%tspan if it is not. The range of tspan is the rightpoint - leftpoint. tspan is redefined by subtracting the remainder of
%range/h from the right endpoint of tspan. If tspan is redefined, the program throws a warning.
endt=tspan(end); %define the last element in tspan as endt
range=endt-tspan(1);      %the range is the rightpoint minus the leftpoint
R=rem(range,h);          %R is the reaminder of the range of t divided by h
if R~=0             	  %if the division of tspan divided by h results in a remainder,
    endt=tspan(end)-R     %subtract R from rightpoint of tspan to make tspan divisible by h
    tspan=[tspan(1),endt] %redfine tspan to be divisible by h
    warning ('The range over which the function is being solved is not divisible by the step size. The range has been reduced to be divisible by the step size. The reaminder will calculated separately with a step size equal to the remainder.')
end %end of tspan if statement

%START OF HEUN'S METHOD
ynext=y0 %so the loop runs the first time
%This loop finds a predicted point with Euler's method.
for i=1:((range/h)-R +1) %we know the number of points we will calculate in advance=the whole number of 
    %range divided by h. We add one because we are calculating y at the
    %start of each range and want to include 1=4. 
    x=i*h; %multiplying h by i adds h each iteration of the for loop
    xprev=x-h; %xprevious is one step size behind x
    yprev=ynext; %redefine y previous as the value from the corrector equation. yprev=y0 on the first iteration
     plot(xprev,yprev,'*b') %makes a plot as new values are received
    hold on
    ypred=yprev+dydt(xprev,yprev)*h; %ypredicted is given by Euler's formula
    ea=1000; %Initialize or reset ea so the while loop isn't skipped
    iter=0; %Initialize or reset iter so the while loop isn't skipped
 
    %This loop iterates the corrector formula. Ultimately gives ynext. Each run results in a ynext that becomes the next iteration's ypred     
    while iter<maxit || es<ea %while iter is less than maxit or the stopping criterion is greater than the error
        ynext=yprev+(dydt(xprev,yprev)+dydt(x,ypred))*(h/2);
        ea=abs(((ynext-ypred)/ynext))*100;
        ypred=ynext; %the value of y we just found becomes the previous value to y to find the next value. 
        iter=iter+1;
    end %End of while loop
end %end of for loop

%This block will run if the original tspan given could not be divided by h.
%This pair of loops runs Heun's method on the remainder given by tspan/h
%with a step size equal to the remainder. 
if R~=0
    x=xprev+h;
    yprev=ynext;
     ypred=yprev+dydt(xprev,yprev)*h; %ypredicted is given by Euler's formula
     while iter<maxit || es<ea %while iter is less than maxit or the stopping criterion is greater than the error
        ynext=yprev+(dydt(xprev,yprev)+dydt(x,ypred))*(h/2);
        ea=abs(((ynext-ypred)/ynext))*100;
        ypred=ynext; %the value of y we just found becomes the previous value to y to find the next value. 
        iter=iter+1;
    end %End of while loop on remainder
        plot(x,ynext,'*b')
end %end of if statement for remainder
    

end %end of function

