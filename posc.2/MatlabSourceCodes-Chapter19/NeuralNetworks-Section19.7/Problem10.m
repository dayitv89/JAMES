clear all;
clc;
disp('Adative Resonance Theory Network 1');
L=2;
m=3;
n=4;
rho=0.4;
te=L/(L-1+n);
te=te/2;
b=[te te te;te te te;te te te;te te te]
t=ones(3,4)
s=[1 1 0 0;0 0 0 1;1 0 0 0;0 0 1 1]
e=1;

while(e<=4)
    temp=0;
    for i=1:4
        temp=temp+s(e,i);
    end
    ns=temp;
    x(e,:)=s(e,:);
    for i=1:3
        temp=0;
        for j=1:4
            temp=temp+(x(e,j)*b(j,i));
        end
        yin(i)=temp;
    end
    j=1;
    if (yin(j)>=yin(j+1)& yin(j)>=yin(j+2))
        J=1;
    elseif (yin(j+1)>=yin(j)&yin(j+1)>=yin(j+2))
        J=2;
    else
        J=3;
    end
    J
    for i=1:4
        x1(i)=x(e,i)*t(J,i);
    end
    x1;
    temp=0;
    for i=1:4
        temp=temp+x1(i);
    end
    nx=temp;
    m=nx/ns;
    if (m<rho)
        yin(J)=-yin(J);
        j=1;
        if (yin(j)>=yin(j+1)&yin(j)>=yin(j+2))
            J=1;
        elseif (yin(j+1)>=yin(j)&yin(j+1)>=yin(j+2))
            J=2;
        else
            J=3;
        end
        J
    end
    for i=1:4
        temp=0;
        temp=L-1+nx;
        b(i,J)=(L*x1(i))/temp;
    end
    b
    for i=1:4
        t(J,i)=x1(i);
    end
    t
    e=e+1;
end        