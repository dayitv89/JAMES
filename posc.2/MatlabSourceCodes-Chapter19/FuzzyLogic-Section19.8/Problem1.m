%Program for fuzzy set with properties and operations
clear all;
clc;
disp('Fuzzy set with properties and operation');
a=[0 1 0.5 0.4 0.6];
b=[0 0.5 0.7 0.8 0.4];
c=[0.3 0.9 0.2 0 1];
phi=[0 0 0 0 0];
disp('Union of a and b');
au=max(a,b)
disp('Intersection of a and b');
iab=min(a,b)
disp('Union of b and a');
bu=max(b,a)
if (au==bu)
    disp('Commutative law is satisfied');
else
    disp('Commutative law is not satisfied');
end
disp('Union of b and c');
cu=max(b,c)
disp('a U (b U c)');
acu=max(a,cu)
disp('(a U b) U c)');
auc=max(au,c)
if (acu==auc)
    disp('Associative law is satisifed');
else
    disp('Associative law is not satisfied');
end
disp('intersection of b and c');
ibc=min(b,c)
disp('a U (b I c)');
dls=max(a,ibc)
disp('Union of a and c');
uac=max(a,c)
disp('(a U b) I (a U c)');
drs=min(au,uac)
if (dls==drs)
    disp('Distributive law is satisfied');
else
    disp('distributive law is not satisfied');
end
disp('a U a');
idl=max(a,a)
a
if (idl==a)
    disp('Idempotency law is satisfied');
else
    disp('Idempotency law is not satsified');
end
disp('a U phi');
idtl=max(a,phi)
a
if (idtl==a)
    disp('Identity law is satisfied');
else
    disp('Identity law is not satisfied');
end
disp('a I phi');
idtl=min(a,phi)
phi
if (idtl==phi)
    disp('Identity law is satisfied');
    else
    disp('Identity law is not satisfied');
end
disp('Complement of (a I b)');
for i=1:5
    ciab(i)=1-iab(i);
end
ciab
disp('Compliment of a');
for i=1:5
    ca(i)=1-a(i);
end
ca
disp('Compliment of b');
for i=1:5
    cb(i)=1-b(i);
end
cb
disp('a Compliment U b Complient');
dml=max(ca,cb)
if (dml==ciab)
    disp('Demorgans law is satisfied');
else
    disp('Demorgans law is not satisfied');
end
disp('Compliment of compliment of a');
for i=1:5
    cca(i)=1-ca(i);
end
cca
a
if (a==cca)
    disp('Involution law is satisified');
else
    disp('Involution law is not satisfied');
end