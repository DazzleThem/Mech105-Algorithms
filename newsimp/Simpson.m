function [I] = Simpson(x,y)
%Simpson uses a combination of the mathematical Simpson's 1/3 composite rule and the
%trapezoid rule to numerically integrate a function over a given range. If
%the number of sections is even, only simpson's rule is used. If the number
%of sections is odd, simpson's rule is used for all but the last, and the
%trapezoid rule is used on the last. A warning is given when trapezoid rule
%is used. Note that if the function has only 1 segment, only the trapezoid
%rule will be used. 
%INPUTS
%x = the x coordinates of the points
%y = the y coordinates of the points. 
%OUTPUTS
%I = The integral calculated by the program.


%check if number of inputs is 2
if nargin ~=2 
    error ('A number of inputs other than 2 given. Function requires 2 inputs')
end
    
%check if number of segments is odd
if mod(x,2)==0 %if the number of endpoints divided by two is zero, the number of endpoints is even
    %and the number of segments is odd.
    warning ('The trapezoid rule will be used on the last interval so that Simpsons rule operates on an even number of intervals')
end

%check if each points has both an x and y coordinate. 
if length(x)~=length(y)
    error ('Each point must have an x and a y coordinate')
end

%check if the segments are equal in length. 
spaces=diff(x);
if max(spaces)~=min(spaces) %if the elements are not evenly spaced
    error('The intervals are not evenly spaced. This functions deals only with evenly spaced intervals.')
end

n=length(x)-1; %n is the number of segments
%calculate integral
if mod(n,2)==0 %if the number of segments is even, we can only use simpson's
    %define terms used in simpson's composite rule
b=max(x); %b is the rightmost x coordinate
a=min(x); %a is the leftmost x coordinate
h=b-a; %h is the step size
sumyodd = sum(y(1:2:end-1)); %the sum of the elements of f(x) in an odd address except for the last element
sumyeven = sum(y(2:2:end-1)); %sum of the elements of f(x) in an even address except for the last element
%use Composite Simpson's rule
I=(h/(3*n))*(y(1)+4*sumyodd+2*sumyeven+y(end)) %formula for composite simpson's rule
        
else %if the number of segments is odd
    b=max(x(1:(end-1))); %the max of all segments except the last
    a=min(x); %the minimum of all segments except the last is the same as the minimum of all segments.
    h=b-a;
    sumyodd = sum(y(1:2:end-2)); %the sum of the elements of f(x) in an odd address in all segments except the last
    sumyeven = sum(y(2:2:end-1)); %sum of the elements of f(x) in an even address in all segments except the last
    
    %use simson's composite rule
    I1=(h/(3*(n-1)))*(y(1)+4*sumyodd+2*sumyeven+y(end-1)); %formula for composite simpson's rule
    rightx=x(end); %rightx is the rightmost element of x
    righty=y(end); %righty is the rightmost element of y
    
    %use trap rule
    I2=(rightx-b)*(y(end-1)+righty)/2;
        
    I=I1+I2 %sum estimates from simpson's rule and trap rule to get overall estimate
end %end of if statement

end %end of function

