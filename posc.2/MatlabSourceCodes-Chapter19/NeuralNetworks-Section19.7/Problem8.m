%To implement Full Counter Propagation network for given input pattern.
clear all;
clc;
disp('FULL COUNTERPROPAGATION NETWORK');
x=[1 0 0 0];
y=[1 0];
alpha=0.4;
beta=0.3;
a=0.2;
b=0.1;
e=1;

v=[0.8 0.2; 0.8 0.2; 0.2 0.8; 0.2 0.8];
w=[0.5 0.5; 0.5 0.5];
t=[0.6 0.4 0.4 0.6];
u=[0.7 0.7];

while(e<=3)
    m=1;
    n=1;
    for j=1:2
        temp=0;
        for k=1:4
            temp= temp + ((v(k,j)-x(k))^2);
        end
        for k=1:2
            temp= temp + ((w(k,j)-y(k))^2);
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
        v(m,J)=v(m,J) + (alpha(e) * (x(m)-v(m,J)));
    end
    v
    for n=1:2
        w(n,J)=w(n,J) + (beta(e) * (y(n)-w(n,J)));
    end
    w
    
    temalpha=alpha(e);
    tembeta=beta(e);
    tema=a(e);
    temb=b(e);
    oe=e;
    te(e)=e;
    e=e+1;
    te(e)=e;
    te1(oe)=oe;
    alpha(e)=(0.5*temalpha);
    alpha
    beta(e)=(0.5*tembeta);
    beta
    
    disp('for Weight updation from cluster unit to output unit');
    for m=1:4
        v(m,J)=v(m,J) + (alpha(e) * (x(m)-v(m,J)));
    end
    v
    for n=1:2
        w(n,J)=w(n,J) + (beta(e) * (y(n)-w(n,J)));
    end
    w
    for m=1:4
        t(m)=t(m) + (b(oe) * (x(m)-t(m)));
    end
    t
    for n=1:2
        u(n)=u(n) + (a(oe) * (y(n)-u(n)));
    end
    u
    
    a(e)=(0.5*tema);
    b(e)=(0.5*temb);
    a
    b
end
te1(e)=e;

x1=te;
x2=te1;
y1=alpha;
y2=beta;
y3=a;
y4=b;
figure(1)
h=plot(x1,y1,x1,y2,x2,y3,x2,y4)
set(h,{'Color'},{'r';'g';'b';'m'})
grid on
xlabel('EPOCH')
ylabel('ERROR RATE')
title('COUNTERPROPAGATION NETWORK')
legend(h,'alpha','beta','a','b')
