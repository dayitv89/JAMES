clear all;
clc;

%Input data
x = 0:.06:2; 
y=sin(x);
P=x; 
T=y;

% Create a multilayer perceptron network

 net=newff([0 2], [5,1], {'tansig','purelin'},'traingd');

% Here newff defines feedforward network architecture.
% The first argument [0 2] defines the range of the input and initializes the network parameters.
% The second argument the structure of the network. There are two layers.
% 5 is the number of the nodes in the first hidden layer,
% 1 is the number of nodes in the output layer,
% Next the activation functions in the layers are defined.
% In the first hidden layer there are 5 tansig functions.
% In the output layer there is 1 linear function.
% learngd defines the basic learning scheme gradient method

% Define learning parameters
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch)
net.trainParam.lr = 0.05; % Learning rate used in some gradient schemes
net.trainParam.epochs =500; % Max number of iterations
net.trainParam.goal = 1e-3; % Error tolerance; stopping criterion

%Train network
net1 = train(net, P, T); % Iterates gradient type of loop

% Simulate how good a result is achieved: Input is the same input vector P.
% Output is the output of the neural network, which should be compared with output data
a= sim(net1,P);

% Plot result and compare
plot(P,a-T, P,T); grid;