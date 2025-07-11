P=10;
T=523;
Pc=111.3;
Tc=407.5;
R=0.082054;
a=(27*R*R*Tc*Tc)/(64*Pc);
b=(R*Tc)/(8*Pc);

guess=4;
err=inf;
i=1;
while ((err>0.00001) || (err<-0.00001))
    er2(i)=abs(err);
    fn=b + ((R*T)/(P+(a/(guess*guess))));
    err = guess - fn;
    guess=fn;
    i2(i)=i;
    i=i+1;
end
disp(["Value of V: ", fn]);
plot(i2,er2,'-o','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])

xlabel("Iteration")
ylabel("Error")
title("Error graph")


