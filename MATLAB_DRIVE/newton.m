%newton

p = 10;
t = 523;
Pc = 111.3;
Tc = 407.5;
R = 0.082054;
a = (27 * R^2 * Tc^2) / (64 * Pc);
b = (R * Tc) / (8 * Pc);

V = 1;
tol = 1e-5;
max_iter = 100;

error = zeros(max_iter, 1);
for i = 1:max_iter
    f = p * V / (R * t) - 1 - (a / (R * t * V)) + (b / V);
    dfdv = p / (R * t) + (a / (R * t * V^2)) - (b / V^2);
    V_new = V - f / dfdv;
    error(i) = abs(V_new - V);
    if error(i) < tol
        break
    end
    V = V_new;
end

disp(["Value of V: ", V]);

plot(1:i, error(1:i),'-o','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]);
xlabel('Iteration');
ylabel('Error');
title('Iteration vs Error');