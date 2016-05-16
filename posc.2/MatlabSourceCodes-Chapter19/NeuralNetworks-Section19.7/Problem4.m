clear all;
clc;
disp('To test Auto associatie network using outer product rule for following input vector');
x1=[1 -1 1 -1];
x2=[1 1 -1 -1];
n=0;
w1=x1'*x1;
w2=x2'*x2;
wm=w1+w2;
disp('input');
x1
x2
disp('Target');
x1
x2
disp('Weights');
w1
w2
disp('Weight matrix using Outer Products Rule');
wm
yin=x1*wm;
yin
for i=1:4
    if(yin(i)>0)
        y=1;
    else
        y=-1;
    end
    ny(i)=y;
    if(y==x1(i))
        n=n+1;
    end
end
ny
if(n==4)
    disp('This pattern is recognized');
else
    disp('This pattern is not recognized');
end
n=0;
yin=x2*wm;
yin
for i=1:4
    if(yin(i)>0)
        y=1;
    else
        y=-1;
    end
    ny(i)=y;
    if(y==x2(i))
        n=n+1;
    end
end
ny
if(n==4)
    disp('This pattern is recognized');
else
    disp('This pattern is not recognized');
end
end 

