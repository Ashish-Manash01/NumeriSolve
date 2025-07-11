num=input("Enter number")
res=1;
if (num<0)
    res="not defined";
end
for i=1:1:num;
    res=res*i;
end
res

x=1:1:num
y=res
plot(x,y)