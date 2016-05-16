%back propagation network
clear all;
clc;
disp('Back propagation Network');
v=[0.7 -0.4;-0.2 0.3]
x=[0 1]
t=[1]
w=[0.5;0.1]
t1=0;
wb=-0.3
vb=[0.4 0.6]
alpha=0.25
e=1;
temp=0;
while (e<=3)
    e
    for i=1:2
        for j=1:2
            temp=temp+(v(j,i)*x(j));
        end
        zin(i)=temp+vb(i);
        temp1=e^(-zin(i));
        fz(i)=(1/(1+temp1));
        z(i)=fz(i);
        fdz(i)=fz(i)*(1-fz(i));
        temp=0;
    end
    
    for k=1
        for j=1:2
            temp=temp+z(j)*w(j,k);
        end
        yin(k)=temp+wb(k);
        fy(k)=(1/(1+(e^-yin(k))));
        y(k)=fy(k);
        temp=0;
    end
    
    for k=1
        fdy(k)=fy(k)*(1-fy(k));
        delk(k)=(t(k)-y(k))*fdy(k);
    end
    
    for k=1
        for j=1:2
            dw(j,k)=alpha*delk(k)*z(j);
        end
        dwb(k)=alpha*delk(k);
    end
    
    for j=1:2
        for k=1
            delin(j)=delk(k)*w(j,k);
        end
        delj(j)=delin(j)*fdz(j);
    end
    
    for i=1:2
        for j=1:2
            dv(i,j)=alpha*delj(j)*x(i);
        end
        dvb(i)=alpha*delj(i);
    end
    
    for k=1
        for j=1:2
            w(j,k)= w(j,k)+dw(j,k);
        end
        wb(k)=wb(k)+dwb(k);
    end
    w,wb
    
    for i=1:2
        for j=1:2
            v(i,j)=v(i,j)+dv(i,j);
        end
        vb(i)=vb(i)+dvb(i);
    end
    v,vb
    te(e)=e;
    e=e+1;
end