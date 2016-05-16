%Program to find a relation using Max-Min Composition
%enter the two vectors whose relation is to be find
R=input('enter the first vector')
S=input('enter the second vector')
% find the size of two vectors
[m,n]=size(R);
[x,y]=size(S);
if(n==x)
for i=1:m
for j=1:y
c=R(i,:);
d=S(:,j);
f=d';
%find the minimum of two vectors
q=min(c,f);
%find the maximum of two vectors
h(i,j)=max(q);
end
end
%print the result
display('the fuzzy relation between two vectors is');
display(h)
else
display('The fuzzy relation cannot be find')
end
