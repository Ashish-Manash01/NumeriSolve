mat=[1,1,1,10;0.04,0.54,0.26,2;0.93,0.24,0,6]

[m,n]=size(mat)

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

x3=mat(3,4)/mat(3,3)
x2=(mat(2,4)-(mat(2,3)*x3))/mat(2,2)
x1=mat(1,4)-x3-x2