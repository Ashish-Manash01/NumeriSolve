fx=@(x) sqrt((1+x)/(1-x));

h=0.02;
a=0;
b=0.8;
n=(b-a)/h;

I=0;
I=I+fx(0*h)+fx(n*h);
for i=1:n-1
    if (mod(i,3)==0)
        I=I+(2*fx(i*h));
    else
        I=I+(3*fx(i*h));
    end
end
I=(3*h*I)/8;
I;

tau=I/(0.01*sqrt(0.0625))