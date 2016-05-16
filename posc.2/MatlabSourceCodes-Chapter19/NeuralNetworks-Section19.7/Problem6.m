clear all;
clc;
disp('Discrete Hopfield Network');
theta=0;
x=[1 -1 -1 -1;-1 1 1 -1;-1 -1 -1 1]
%Calculating Weight Matrix
w=x'*x
%calculating Energy
k=1;
while(k<=3)
    temp=0;
    for i=1:4
        for j=1:4
            temp=temp+(x(k,i)*w(i,j)*x(k,j));
        end
    end
    E(k)=(-0.5)*temp;
    k=k+1;
end
%Energy Function for 3 samples
E

%Test for given pattern s=[-1 1 -1 -1]
disp('Given input pattern for testing');
x1=[-1 1 -1 -1]
temp=0;
for i=1:4
    for j=1:4
        temp=temp+(x1(i)*w(i,j)*x1(j));
    end
end
SE=(-0.5)*temp
disp('By synchronous updation method');
disp('The net input calculated is');
yin=x1*w
for i=1:4
    if(yin(i)>theta)
        y(i)=1;
    elseif(yin(i)==theta)
        y(i)=yin(i);
    else
        y(i)=-1;
    end
end
disp('The output calculated from net input is');
y
temp=0;
for i=1:4
    for j=1:4
        temp=temp+(y(i)*w(i,j)*y(j));
    end
end
SE=(-0.5)*temp
n=0;
for i=1:3
    if (SE==E(i))
        n=0;
        k=i;
    else
        n=n+1;
    end
end

if(n==3)
    disp('Pattern is not associated with any input pattern');
else
    disp('The test pattern');
    x1
    disp('is associated with');
    x(k,:)
end