num=input("Enter last number");
ini=1:num;
for i=1:num
    fact=1;
    for j=1:i
        fact=fact*j;
    end
    fin(i)=fact;
end
ini
fin
x=ini;
y=fin;

plot(x,y)

xlabel("number")
ylabel("factorial")
title("FACTORIAL")