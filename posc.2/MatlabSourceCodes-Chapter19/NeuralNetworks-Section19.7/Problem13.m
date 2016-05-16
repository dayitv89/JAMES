%Program to create a perceptron network using command 'newp'
net = newp([ -2 2; -2 2], 1);
%No. of epochs is given as 4
net.trainParam.epochs = 4;
%Let define the input vectors and the target vector
p = [ [2 ;2 ] [1; -2] [-2 ; 2], [-1; 1] ];
t = [0 1 0 1];
%The net can be train with
net = train(net, p, t) ;
%Finally simulate the trained network for each of the inputs.
a = sim(net,p)