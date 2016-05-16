%program for Genetic algorithm to maximize the function f(x) =xsquare
clear all;
clc;
%x ranges from 0 to 31  2power5 = 32
%five bits are enough to represent x in binary representation
n=input('Enter no. of population in each iteration');
nit=input('Enter no. of iterations');
%Generate the initial population
[oldchrom]=initbp(n,5)
%The popultion in binary is converted to integer
FieldD=[5;0;31;0;0;1;1]
for i=1:nit
    phen=bindecod(oldchrom,FieldD,3); % phen gives the integer value of the binary population
    %obtain fitness value
    sqx=phen.^2;
    sumsqx=sum(sqx);
    avsqx=sumsqx/n;
    hsqx=max(sqx);
    pselect=sqx./sumsqx;
    sumpselect=sum(pselect);
    avpselect=sumpselect/n;
    hpselect=max(pselect);
    %apply roulette wheel selection
    FitnV=sqx;
    Nsel=4;
    newchrix=selrws(FitnV, Nsel);
    newchrom=oldchrom(newchrix,:);
    %Perform Crossover
    crossrate=1;
    newchromc=recsp(newchrom,crossrate); %new population after crossover
    %Perform mutation
    vlub=0:31;
    mutrate=0.001;
    newchromm=mutrandbin(newchromc,vlub,0.001); %new population after mutation 
    disp('For iteration');
    i
    disp('Population'); 
    oldchrom
    disp('X');
    phen
    disp('f(X)');
    sqx    
    oldchrom=newchromm;    
end