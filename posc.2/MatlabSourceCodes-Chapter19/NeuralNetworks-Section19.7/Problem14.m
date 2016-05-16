%Program to create a feed forward network and perfrom batch training
%Create a training set of inputs p and targets t. 
%For batch training, all of the input vectors are placed in one matrix.
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];
%Create the feedforward network. The function minmax is used to
%determine the range of the inputs to be used in creating the network.
net=newff(minmax(p),[3,1],{'tansig','purelin'},'traingd');
%Set training parameters.
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
% Now train the network.
[net,tr]=train(net,p,t);
% The training record tr contains information about the progress of training.
% Now the trained network can be simulated to obtain its response to the inputs in the
% training set.
a = sim(net,p)