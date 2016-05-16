%To implement AND function using MADALINE with bipolar inputs and outputs
%PROGRAM:
clear all;
clc;
disp('madaline network for and function bipolar inputs, bipolar targets');
    x1=[1 1 -1 -1]; %input pattern
    x2=[1 -1 1 -1]; %input pattern
    x3=[1 1 1 1];   %x3 for bias
    t=[1 -1 -1 -1];   %target
    w11=0.1;
    w12=0.1;
    w21=0.1;
    w22=0.1;
    b1=0.1;
    b2=0.1;
    b3=0.5;
    v1=0.5;
    v2=0.5;
    alpha=0.5;
    e=2;
    delw11=0;
    delw12=0;
    delw21=0;
    delw22=0;
    delb1=0;
    delb2=0;
    delb3=0;
    delv1=0;
    delv2=0;
    epoch=0;
    while (e>1.00)
        epoch=epoch+1
        e=0;
        
        for i=1:4
            zin1=x1(i)*w11+x2(i)*w21+b1;
            zin2=x1(i)*w12+x2(i)*w22+b2;
            z=[zin1 zin2];
            if (zin1>=0)
                z1=1;
            else
                z1=-1;
            end
    
            if (zin2>=0)
                z2=1;
            else
                z2=-1;
            end
    
            hid=[z1 z2];
            nety=b3+z1*v1+z2*v2;
    
            if (nety>=0)
                y=1;
            else 
                y=-1;
            end
    
            nt=[t(i) nety y];
            
            if (t(i)==1)
                if (zin1<zin2)
                    delb1=alpha*(1-zin1);
                    b1=b1+delb1;
                    delw11=alpha*(1-zin1)*x1(i);
                    w11=w11+delw11;
                    delw21=alpha*(1-zin1)*x1(i);
                    w21=w21+delw21;
                else
                    delb2=alpha*(1-zin2);
                    b2=b2+delb2;
                    delw12=alpha*(1-zin2)*x2(i);
                    w12=w12+delw12;
                    delw22=alpha*(1-zin2)*x2(i);
                    w22=w22+delw22;
                end
                                      
            elseif (t(i)==-1)
                if (zin1>0)
                    delb1=alpha*(-1-zin1);
                    b1=b1+delb1;
                    delw11=alpha*(-1-zin1)*x1(i);
                    w11=w11+delw11;
                    delw21=alpha*(-1-zin1)*x1(i);
                    w21=w21+delw21;
                else
                    delb2=alpha*(-1-zin2);
                    b2=b2+delb2;
                    delw12=alpha*(-1-zin2)*x2(i);
                    w12=w12+delw12;
                    delw22=alpha*(-1-zin2)*x2(i);
                    w22=w22+delw22;
                end    
            end
            
            del=[delw11 delw21 delb1 delw12 delw22 delb2];
            in=[x1(i) x2(i) x3(i)];
            bi=[v1 v2 b3];
            
            pr=[in z hid nt del bi]
        end
        
        for i=1:4
             zin1=b1+x1(i)*w11+x2(i)*w21;
            zin2=b2+x1(i)*w12+x2(i)*w22;
            z=[zin1 zin2];
            if (zin1>=0)
                z1=1;
            else
                z1=-1;
            end
            if (zin2>=0)
                z2=1;
            else
                z2=-1;
            end
            nety=v1*z1+v2*z2+b3;
            e=e+(t(i)-nety)^2;
        end
    end
