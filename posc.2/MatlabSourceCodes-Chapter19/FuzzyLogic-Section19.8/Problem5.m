%Program to check whether the given relation 
%is an Equivalence relation or not 
p=input('enter the matrix')
sum=0;
sum1=0;
sum2=0;
sum3=0;
[m,n]=size(p);
l=m;
if(m==n)
    for i=1:m
        if(p(1,1)==p(i,i))
        else
            fprintf(' the given relation is irreflexive  ');
            sum1=1;
            break;
        end
    end
    if(sum1 ~= 1)
        fprintf(' the given relation is reflexive');
    end
    m;
    n;
    [m,n]=size(p)
    for i=1:m
        for j=1:n
            if(p(i,j)==p(j,i))
            else
                fprintf(' , not symmetry');
                sum=1;
                break;
            end
        end
        if(sum==1)
            break;
        end
    end
    if(sum~=1)
        fprintf(' ,symmetry');
    end
for i=1:m
    for j=1:n
        for k=l:-1:1
            lambda1=p(i,j);
            lambda2=p(j,k);
            lambda3=p(i,k);
            q=min(lambda1,lambda2);
            if(lambda3 >= q)
            else
                sum2=1;
                break;
            end
        end
    end
end
if(sum2 ~= 1)
        fprintf(' and transitivity hence ');
    else
        fprintf(' and not transitivity hence ');
    end
if(sum1~=1)
    if(sum~=1)
        if(sum2~=1)
        fprintf(' the given relation is equivalence relation');
    else   
        fprintf('the given relation is not equivalence  relation');
    end
else   
    fprintf('not equivalence  relation');
end
else   
    fprintf('not equivalence  relation');
end
end
