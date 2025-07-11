t=[0,20,40,60,80,100,120];
c=[0.01756,0.0093,0.00531,0.00295,0.00167,0.00094,0.00014];

n=numel(t);
d=zeros(1,n);
sum=0;

for i=1:n-2
    h=t(i+1)-t(i);
    M=containers.Map(t,c);
    der=(M(t(i+2))-4*M(t(i+1))+3*M(t(i)))/(-2*h)
    d(i)=der;
    sum=sum+der;
end

avg_der=sum/(n-2)
d;

plot(t, c,'-o','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]);