Re=6500;
epsd=0.00013;
f0=0.1;

guess=f0;

err=inf;
i=1;
while ((err>0.0001) || (err<-0.0001))
    x=1/sqrt(guess);
    disp(["x:",x]);

    er2(i)=abs(err);
    fn=-x-(0.86*log((epsd/3.7)+((2.51*x)/(Re))));
    disp(["f:",1/(guess*guess)]);
    err = guess - fn;
    guess=fn;
    i2(i)=i;
    i=i+1;
end
disp(["Value of f: ", (1/(guess*guess))]);
plot(i2,er2,'-o','MarkerSize',4,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6])

xlabel("Iteration")
ylabel("Error")
title("Error graph")


