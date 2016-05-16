%Program to depict membership functions
x=(0:0.1:10)';
y1=gaussmf(x,[2 4]);
%Plot of Gaussian membership function
plot(x,y1)
hold
%Plot of Triangular membership function
y2=trimf(x,[5 6 7]);
plot(x,y2)