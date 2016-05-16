clear all;
clc;
disp('Adative Resonance Theory 2');
s=[0.8 0.6]
a=10;
b=10;
c=0.1;
d=0.9;
e=0;
rho=0.9;
theta=0.7;
wb=[7.0 7.0];
wt=[0 0];
alpha=0.6;
it=1;
u=[0.0 0.0]
tem=0;
for i=1:2
    tem=s(i)^2+tem;
end
ns=sqrt(tem);
p=[0 0]
for i=1:2
    x(i)=s(i);
    w(i)=s(i);
    q(i)=p(i);
end
x
w
q
temp=0;
temp1=0;
for i=1:2
    temp=w(i)^2+temp;
    temp1=p(i)^2+temp1;
end
nw=sqrt(temp);
np=sqrt(temp1);

for i=1:2
    if (x(i)>=theta)
        fx=x(i);
    else
        fx=0;
    end
    if (q(i)>=theta)
        fq=q(i);
    else
        fq=0;
    end
    v(i)=fx+(b*fq);
end
    v
    
tem=0;
for i=1:2
    tem=tem+v(i)^2;
end
nv=sqrt(tem);

disp('Updating F1 activation again');
for i=1:2
    u(i)=v(i);
    w(i)=s(i)+(a*u(i));
    p(i)=u(i);
end
u
w
p
tem=0;
temp=0;
for i=1:2
    tem=tem+w(i)^2;
    temp=temp+p(i)^2;
end
nw=sqrt(tem);
np=sqrt(temp);
for i=1:2
    x(i)=w(i);
    q(i)=p(i);
end
x
q
for i=1:2
    if (x(i)>=theta)
        fx=x(i);
    else
        fx=0;
    end
    if (q(i)>=theta)
        fq=q(i);
    else
        fq=0;
    end
    v(i)=fx+(b*fq);
end
v
disp('Computing signal to F2');
for i=1:2
    temp=0;
    temp=temp+wb(i)*p(i);
    y(i)=temp;
end
y
temp=0;
temp1=0;
for i=1:2
    temp=temp+v(i)^2;
    temp1=temp1+u(i)^2;
end
nv=sqrt(temp);
nu=sqrt(temp1);
for i=1:2
    u(i)=v(i);
    p(i)=u(i)+(d*wt(i));
end
u
p
temp=0;
for i=1:2
    temp=temp+p(i)^2;
end
np=sqrt(temp);
for i=1:2
    r(i)=(u(i)+c*p(i))/(e+nu+(c*np));
end
temp=0;
for i=1:2
    temp=r(i)^2+temp;
end
nr=sqrt(temp);
i=1;
if(y(i)>=y(i+1))
    J=1;
else
    J=2;
end
%Check for RESET
if (nr>=rho)
    for i=1:2
        w(i)=s(i)+a*u(i);
        v(i)=fx+b*fq;
        temp=0;
        tem=0;
        for i=1:2
            temp=temp+w(i)^2;
            tem=tem+p(i)^2;
        end
        nw=sqrt(temp);
        np=sqrt(tem);
        x(i)=w(i)/(e+nw);
        q(i)=p(i)/(e+np);
    end
end
disp('Update weights for 2 iterations');
while (it<=2)
    wt(J)=(alpha*d*u(J))+1+(alpha*d)*wt(J);
    wb(J)=(alpha*d*u(J))+1+(alpha*d)*wb(J);
    wt
    wb
    for i=1:2
        u(i)=v(i);
        p(i)=u(i)+d*wt(i);
        w(i)=s(i)+a*u(i);
        x(i)=w(i);
        q(i)=p(i);
        v(i)=fx+b*fq;
    end
    it=it+1;
end    