%bisection

p=10;
t=523;
Pc=111.3;
Tc=407.5;
R=0.082054;
a=(27*R*R*Tc*Tc)/(64*Pc);
b=(R*Tc)/(8*Pc);
a1 = 5;
b1 = 1;

fa1 = (p + (a / (a1 * a1))) * (a1 - b) - (R * t);
fb1 = (p + (a / (b1 * b1))) * (b1 - b) - (R * t);

if (fa1 * fb1 > 0)
    disp("invalid");
else
    repeat = 50;
    tol = 1e-5;
    for i = 1:repeat
        i2(i)=i;
        mid = (a1 + b1) / 2;
        fmid = (p + (a / (mid * mid))) * (mid - b) - (R * t);
        
        if (fmid * fb1 < 0)
            a1 = mid;
        else
            b1 = mid;
        end
        
        err = abs(b1 - a1);
        err2(i)=err;
        if (err <= tol)
            break;
        end
    end
end

disp(["Value of V: ", mid]);
plot(i2,err2,'-o','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])

xlabel("Iteration")
ylabel("Error")
title("Error graph")