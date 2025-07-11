mat=[1,1,1,10;0.04,0.54,0.26,2;0.93,0.24,0,6]

[m,n]=size(mat);

a=mat(2,1)/mat(1,1)
for i=1:n
    mat(2,i)=mat(2,i)-(a*mat(1,i));
end
mat

b=mat(3,1)/mat(1,1)
for i=1:n
    mat(3,i)=mat(3,i)-(b*mat(1,i));
end
mat

c=mat(3,2)/mat(2,2)
for i=1:n
    mat(3,i)=mat(3,i)-(c*mat(2,i));
end
mat

d=mat(1,3)/mat(3,3)
for i=1:n
    mat(1,i)=mat(1,i)-(mat(3,i)*d);
end
mat

e=mat(2,3)/mat(3,3)
for i=1:n
    mat(2,i)=mat(2,i)-(e*mat(3,i));
end
mat

f=mat(1,2)/mat(2,2)
for i=1:n
    mat(1,i)=mat(1,i)-(f*mat(2,i));
end
mat

x1=mat(1,4)/mat(1,1);
x2=mat(2,4)/mat(2,2);
x3=mat(3,4)/mat(3,3);

disp(["Value of x1",x1]);
disp(["Value of x2",x2]);
disp(["Value of x3",x3]);