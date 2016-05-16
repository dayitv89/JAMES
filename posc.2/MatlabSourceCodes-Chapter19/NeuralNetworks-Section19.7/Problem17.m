% Define the simulation parameters for Van der Pol equation
% The period of simulation: tfinal = 15 seconds;
tfinal = 15;
% Solve Van der Pol differential equation
[t,x]=sim('vandpol',tfinal);
% Plot the states as function of time
plot(t,x)
xlabel('time (secs)'); 
ylabel('x1 and x2 - states'); 
title('Van Der Pol Equation'); 
grid

%Plot of training vectors
P = t';
T = x';
plot(P,T,'+');
title('Training Vectors');
xlabel('Input Vector P');
ylabel('Target Vector T');

% Define the learning algorithm parameters- a feed forward network chosen
net=newff([0 20], [10,2], {'tansig','purelin'},'trainlm');

%Define parameters
net.trainParam.show = 100;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 500;
net.trainParam.goal = 1e-3;

%Train network
net1 = train(net, P, T);