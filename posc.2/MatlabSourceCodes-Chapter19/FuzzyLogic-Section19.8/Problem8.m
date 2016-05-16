%Programto find a relation using Max-Product Composition
%enter the two input vectors
R=input('enter the first vector')
S=input('enter the second vector')
%find the size of the two vector
[m,n]=size(R);
[x,y]=size(S);
if(n==x)
for i=1:m
for j=1:y
c=R(i,:);
d=S(:,j);
[f,g]=size(c);
[h,q]=size(d);
%finding product
for l=1:g
e(1,l)=c(1,l)*d(l,1);
end
%finding maximum
t(i,j)=max(e);
end
end
disp('Max-product composite relation is');
disp(t)
else
display('Cannot find realtion using max product composition');
end
