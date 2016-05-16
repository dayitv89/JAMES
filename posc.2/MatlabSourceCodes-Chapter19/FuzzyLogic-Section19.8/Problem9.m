%Lambda Cut method of defuzzification
% Enter the given relational matrix
R=input('Enter the relational matrix')
% Enter the lambda value
lambda=input('enter the lambda value')
[m,n]=size(R);
for i=1:m
for j=1:n
if(R(i,j)<lambda)
b(i,j)=0;
else
b(i,j)=1;
end
end
end
% output value
display('the crisp value is')
display(b)