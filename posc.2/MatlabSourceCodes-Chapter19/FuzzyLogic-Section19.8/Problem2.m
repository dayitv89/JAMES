%program for composition on Fuzzy and Crisp relations
clear all;
clc;
disp('Composition on Crisp relation');
a=[0.2 0.6]
b=[0.3 0.5]
c=[0.6 0.7]

for i=1:2
    r(i)=a(i)*b(i);
    s(i)=b(i)*c(i);
end
r
s

irs=min(r,s)

disp('Crisp - Composition of r and s using max-min composition');
crs=max(irs)

for i=1:2
    prs(i)=r(i)*s(i);
end
prs

disp('Crisp - Composition of r and s using max-product composition');
mprs=max(prs)

disp('Fuzzy Composition');
firs=min(r,s)

disp('Fuzzy - Composition of r and s using max-min composition');
frs=max(firs)

for i=1:2
    fprs(i)=r(i)*s(i);
end
fprs

disp('Fuzzy - Composition of r and s using max-product composition');
fmprs=max(fprs)