% Program to check whether the given matrix is tolerance matrix or not
p=input('enter the matrix')
sum=0;
sum1=0;
[m,n]=size(p);
if(m==n)
    for i=1:m
        if(p(1,1)==p(i,i))
        else
            fprintf(' the given matrix is irrelexive and  ');
            sum1=1;
            break;
        end
    end
    if(sum1 ~= 1)% to find equivalance matrix
r=input('enter the matrix')
sum=0;
sum1=0;
sum2=0;
sum3=0;
[m,n]=size(r);
l=m;
if(m==n)
    for i=1:m
        if(r(1,1)==r(i,i))
        else
            fprintf(' the given matrix is irreflexive  ');
            sum1=1;
            break;
        end
    end
    if(sum1 ~= 1)
        fprintf(' the given matrix is reflexive');
    end
    m
    n
    [m,n]=size(r)
    for i=1:m
        for j=1:n
            if(r(i,j)==r(j,i))
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
            lambda1=r(i,j);
            lambda2=r(j,k);
            lambda3=r(i,k);
            p=min(lambda1,lambda2);
            if(lambda3 >= p)
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
        fprintf(' the given matrix is equivalence matrix');
    else   
        fprintf('the given matrix is not equivalence  matrix');
    end
else   
    fprintf('not equivalence  matrix');
end
else   
    fprintf('not equivalence  matrix');
end
end

        fprintf('the given matrix is reflexive and ');
    end
    for i=1:m
        for j=1:n
            if(p(i,j)==p(j,i))
            else
                fprintf('not symmetry hence ');
                sum=1;
                break;
            end
        end
        if(sum==1)
            break;
        end
    end
    if(sum~=1)
        fprintf('symmetry hence ');
    end
end
if(sum1~=1)
    if(sum~=1)
        fprintf('the given matrix  tolerance matrix');
    else   
        fprintf(' the given matrix is not tolerance matrix');
    end
else   
    fprintf(' the given matrix is not tolerance matrix');
end
