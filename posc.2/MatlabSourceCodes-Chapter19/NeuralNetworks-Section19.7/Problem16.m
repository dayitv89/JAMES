%Generate data
x = -3:0.25:3
y = -3:0.25:3
z = sin(x)'*cos(y)
surf(x,y,z)
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
title('surface z = sin(x)cos(y)');

%Store data in input matrix P and output vector T
P = [x;y]; 
T = z;

%Set small number of neurons in the first layer, say 25, 25 in the output.
%Initialize the network
net=newff([-3 3; -3 3], [25 25], {'tansig' 'purelin'},'trainlm');

%Apply Levenberg-Marquardt algorithm
%Define parameters
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-3;

%Train network
net1 = train(net,P,T);
a= sim(net1,P);
surf(x,y,a)
