%secant

p = 10;
t = 523;
Pc = 111.3;
Tc = 407.5;
R = 0.082054;
a = (27 * R^2 * Tc^2) / (64 * Pc);
b = (R * Tc) / (8 * Pc);

v1 = b;         
v2 = (R * t) / p;

tol = 1e-5;
max_iter = 100;
errors = zeros(1, max_iter);
for i = 1:max_iter
    f1 = (p + a/v1^2) * (v1 - b) - R * t;
    f2 = (p + a/v2^2) * (v2 - b) - R * t;   
    v_new = v2 - f2 * (v2 - v1) / (f2 - f1);
    f_new = (p + a/v_new^2) * (v_new - b) - R * t;
    errors(i) = abs(f_new);
    if errors(i) < tol
        disp(["Value of V: ", v_new]);
        break;
    end  
    v1 = v2;
    v2 = v_new;
end
if i == max_iter
    warning('Max iterations reached without convergence.');
end

errors = errors(1:i);

plot(0:i-1, errors);
xlabel('Iteration');
ylabel('Error');
title('Error Graph');

