function [L,U,P] = luFactor(A)
%luFactor determines the lu factorization of a square matrix using partial
%pivoting.
%Inputs
    %A = square coefficient matrix
%Outputs
    %L = lower triangular matrix
    %U = upper triangular matrix
    %P = pivot matrix
 if nargin<1 %check for correct number of inputs. 
     error 'One input is required.'
 end
[r,c]=size(A); %r represents rows of A, c represents columns of A
if r~=c %check if the number of rows is the same as the number of columns
    error 'The matrix is not square. This function deals only with square matrices.'
end
U=A; %Initialize U matrix. 
P=zeros(r,r); %initialize permutation matrix of the same dimensions as A.
for rnum=1:r; %this loop puts ones along the diagonal of P.
    P(rnum,rnum)=1;
end
L=P; %initialize L as an empty matrix of the same dimensions as A with ones along the diagonal.

for rnum=1:r-1; % rnum is the number of row you currently want zero in. The column we want a zero in is rnum-1
end
   
for cnum=1:c-1 ;% cnum is the column number you currently want zero in. We don't change anything in the last column
    for rnum=cnum+1:r; %the row we want a zero in is always going to be one more than the column number
        %the row available for pivoting is always equal to the column number
   
        if abs(U(rnum,cnum))>abs(U(cnum,cnum)) %deciding if need to pivot
      
           swaprow=U(rnum,:); %storing row as swaprow
           U(rnum,:)=U(cnum,:);%row replaces row above
           U(cnum,:)=swaprow ;%swaprow replaces row above
           %Now we need to make the corresponding changes to P matrix
           swaprow=P(rnum,:) ;%storing row as swaprow
           P(rnum,:)=P(cnum,:); %row replaces row above
           P(cnum,:)=swaprow; %swaprow replaces row above
           %Now we need to make the corresponding changes to L matrix
           swaprow=L(rnum,1:cnum-1) ;%storing row as swaprow. We take all the columns to the left of our current element
           L(rnum,1:cnum-1)=L(cnum,1:cnum-1); %row replaces row above. 
           L(cnum,1:cnum-1)=swaprow; %swaprow replaces row above. 
           
           
        end %end of pivoting
        
        %Gaussian elimination
        if U(rnum,cnum)~=0 %if the element is already zero, we don't need to make it zero
            multiplier=U(rnum,cnum)/U(cnum,cnum);%defining the factor to multiply by the upper row to get rid of the element in the lower row
            L(rnum,cnum)=multiplier; %store multiplier in L matrix
            temprow=multiplier*U(cnum,:); %we don't want the upper row to permanently change, so it is stored as temprow.
            U(rnum,:)= U(rnum,:)-temprow ;%getting new lower row by subtracting temprow from lower row. 
        end
       
    end %end of column loop
    
end %end of row loop

end 

