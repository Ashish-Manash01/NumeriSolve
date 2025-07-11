fx=@(x) sqrt((1+x)/(1-x));

h=0.02;
a=0;
b=0.8;
n=(b-a)/h;

I=0;
I=I+fx(0*h)+fx(n*h);
for i=1:2:n-1
    I=I+(4*fx(h*i));
end
for j=2:2:n-2
    I=I+(2*fx(j*h));
end

I=(h*I)/3;
I;

tau=I/(0.01*sqrt(0.0625))
