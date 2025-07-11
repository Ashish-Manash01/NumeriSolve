e=0.00001;
x2=0;
x3=0;
max=100;
iter=0;
x1p=10-x2-x3;
while iter<max
    x1=10-x2-x3;
    if ((abs(x1p-x1)<e) && (iter>1))
        break
    end
    x2=(2-(0.04*x1)-(0.26*x3))/0.54;
    x3=(2-(0.03*x1)-(0.22*x2))/0.74;
    iter=iter+1;
    x1p=x1;
end

disp(["Value of x1",x1]);
disp(["Value of x2",x2]);
disp(["Value of x3",x3]);