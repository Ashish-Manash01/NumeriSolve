f=@(t,ca) (10/3)-(ca*(0.1+(1/3)));
c0=10;
t0=0;
h=0.01;
tn=12;
n=(tn-t0)/h;
c=zeros(1,n);
t=zeros(1,n);
c(1)=c0;
t(1)=t0;
for i=1:n
    cn=c0+(h*f(t0+(i*h),c0));
    c0=cn;
    t(i+1)=t0+i*h;
    c(i+1)=cn;
end
cn
plot(t,c)
xlabel("t")
ylabel("")