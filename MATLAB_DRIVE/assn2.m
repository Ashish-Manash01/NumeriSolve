mat=[1,1,1,1000;0.71,0.44,0.08,300;0.27,0.55,0.39,400]

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

x3=mat(3,4)/mat(3,3);
x2=(mat(2,4)-(mat(2,3)*x3))/mat(2,2);
x1=mat(1,4)-x3-x2;

disp(["Value of x1",x1]);
disp(["Value of x2",x2]);
disp(["Value of x3",x3]);