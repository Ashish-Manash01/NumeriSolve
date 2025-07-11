Re=65000;
epsd=0.00013;

a1 = 0.01;
b1 = 0.05;

a1_new=1/sqrt(a1);
b1_new=1/sqrt(b1);
guess=(a1_new+b1_new)/2;

fa1 = -a1_new-(0.86*log((epsd/3.7)+((2.51*a1_new)/(Re))));
fb1 = -b1_new-(0.86*log((epsd/3.7)+((2.51*b1_new)/(Re))));

if (fa1 * fb1 > 0)
    disp("invalid");
else
    repeat = 50;
    tol = 1e-7;
    for i = 1:repeat
        i2(i)=i;
        mid = (a1_new + b1_new) / 2;
        fmid = -x-(0.86*log((epsd/3.7)+((2.51*mid)/(Re))));
        
        if (fmid * fb1 < 0)
            a1_new = mid;
        else
            b1_new = mid;
        end
        
        err = abs(b1_new - a1_new);
        err2(i)=err;
        if (err <= tol)
            break;
        end
    end


disp(["Value of f: ", 1/(mid*mid)]);
plot(i2,err2,'-o','MarkerSize',4,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])

xlabel("Iteration")
ylabel("Error")
title("Error graph")

end