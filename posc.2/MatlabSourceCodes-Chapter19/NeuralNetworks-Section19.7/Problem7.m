%To implement Kohonen self organizing feature maps for given input pattern using learning rate as 0.6
clear all;
clc;
disp('Kohonen self organizing feature maps');
disp('The input patterns are');
x=[1 1 0 0; 0 0 0 1; 1 0 0 0 ; 0 0 1 1]
t=1;
alpha(t)=0.6;
e=1;

disp('Since we have 4 input pattern and cluster unit to be formed is 2, the weight matrix is');
w=[0.2 0.8; 0.6 0.4; 0.5 0.7; 0.9 0.3]

disp('The learning rate of this epoch is');
alpha

while(e<=3)
    i=1;
    j=1;
    k=1;
    m=1;
    disp('Epoch =');
    e
    while(i<=4)    
        for j=1:2
            temp=0;
            for k=1:4
                temp= temp + ((w(k,j)-x(i,k))^2);
            end
            D(j)=temp
        end
        if(D(1)<D(2))
            J=1;
        else
            J=2;
        end
        disp('The winning unit is ');
        J
        disp('Weight updation');
        for m=1:4
            w(m,J)=w(m,J) + (alpha(e) * (x(i,m)-w(m,J)));
        end
        w
        i=i+1;
    end
    temp=alpha(e);
    e=e+1;
    alpha(e)=(0.5*temp);
    %disp('First Epoch completed');
    %disp('Learning rate updated for second epoch');
    alpha(e)
end
