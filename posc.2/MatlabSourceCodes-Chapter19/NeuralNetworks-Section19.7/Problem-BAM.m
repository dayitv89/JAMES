clear all;
clc;
disp('Bidirectional Associative Memory Network');
x1=[1 0 0 0];  
x2=[1 0 0 1];
x3=[0 1 0 0];
x4=[0 1 1 0];
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

%other direction
w=w'

xin1=t1*w
xin2=t2*w
xin3=t3*w
xin4=t4*w

t1=[1 -1];
t2=[1 -1];
t3=[-1 1];
t4=[-1 1];

for i=1:4
    if(xin1(i)>0)
        xx1(i)=1;
    elseif (xin1(i)==0)
        xx1(i)=0;
    else
        xx1(i)=-1;
    end
end
xx1
for i=1:4
    if(xx1(i)==x1(i))
        n=n+1;
    end
end
if (n==4)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:4
    if(xin2(i)>0)
        xx2(i)=1;
    elseif (xin2(i)==0)
        xx2(i)=0;
    else
        xx2(i)=-1;
    end
end
xx2
for i=1:4
    if(xx2(i)==x2(i))
        n=n+1;
    end
end
if (n==4)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:4
    if(xin3(i)>0)
        xx3(i)=1;
    elseif (xin3(i)==0)
        xx3(i)=0;
    else
        xx3(i)=-1;
    end
end
xx3
for i=1:4
    if(xx3(i)==x3(i))
        n=n+1;
    end
end
if (n==4)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;
for i=1:4
    if(xin4(i)>0)
        xx4(i)=1;
    elseif (xin4(i)==0)
        xx4(i)=0;
    else
        xx4(i)=-1;
    end
end
xx4
for i=1:4
    if(xx4(i)==x4(i))
        n=n+1;
    end
end
if (n==4)
    disp('The pattern is matched');
else
    disp('The pattern is not matched');
end
n=0;