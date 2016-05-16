%Program to find union, intersection and complement of fuzzys sets
% Enter the two Fuzzy sets
u=input('enter the first fuzzy set A');
v=input('enter the second fuzzy set B');
disp('Union of A and B');
w=max(u,v)
disp('Intersection of A and B');
p=min(u,v)
[m]=size(u);
disp('Complement of A');
q1=ones(m)-u
[n]=size(v);
disp('Complement of B');
q2=ones(n)-v