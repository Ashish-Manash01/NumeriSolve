e=0.00001;
x2=0;
x3=0;
max=100;
iter=0;
x1p=1000-x2-x3;
while iter<max
    x1=1000-x2-x3;
    if ((abs(x1p-x1)<e) && (iter>1))
        break
    end
    x2=(300-(0.71*x1)-(0.08*x3))/0.44;
    x3=(400-(0.27*x1)-(0.55*x2))/0.39;
    iter=iter+1;
    x1p=x1;
end

disp(["Value of x1",x1]);
disp(["Value of x2",x2]);
disp(["Value of x3",x3]);