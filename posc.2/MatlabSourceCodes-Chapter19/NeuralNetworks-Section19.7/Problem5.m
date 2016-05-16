%To construct and test Hetero associative network for binary inputs and targets
%PROGRAM:
clear all;
clc;
disp('Heteroassociative Network');
x1=[1 0 0 0];  
x2=[1 1 0 0];
x3=[0 0 0 1];
x4=[0 0 1 1];
t1=[1 0];
t2=[1 0];
t3=[0 1];
t4=[0 1];
n=0;
for i=1:4
    for j=1:2
            w(i,j)=((2*x1(i))-1)*((2*t1(j))-1)+((2*x2(i))-1)*((2*t2(j))-1)+((2*x3(i))-1)*((2*t3(j))-1)+((2*x4(i))-1)*((2*t4(j))-1);
        end
    end
w
   
yin1=x1*w
yin2=x2*w
yin3=x3*w
yin4=x4*w

t1=[1 -1];
t2=[1 -1];
t3=[-1 1];
t4=[-1 1];

for i=1:2
    if(yin1(i)>0)
        y1(i)=1;
    elseif (yin1(i)==0)
        y1(i)=0;
    else
        y1(i)=-1;
    end
end
y1
for i=1:2
    if(y1(i)==t1(i))
        n=n+1;
    end
end
if (n==2)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:2
    if(yin2(i)>0)
        y2(i)=1;
    elseif (yin2(i)==0)
        y2(i)=0;
    else
        y2(i)=-1;
    end
end
y2
for i=1:2
    if(y2(i)==t2(i))
        n=n+1;
    end
end
if (n==2)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:2
    if(yin3(i)>0)
        y3(i)=1;
    elseif (yin3(i)==0)
        y3(i)=0;
    else
        y3(i)=-1;
    end
end
y3
for i=1:2
    if(y3(i)==t3(i))
        n=n+1;
    end
end
if (n==2)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:2
    if(yin4(i)>0)
        y4(i)=1;
    elseif (yin4(i)==0)
        y4(i)=0;
    else
        y4(i)=-1;
    end
end
y4
for i=1:2
    if(y4(i)==t4(i))
        n=n+1;
    end
end
if (n==2)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n-0;