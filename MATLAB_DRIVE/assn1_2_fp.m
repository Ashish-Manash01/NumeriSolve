R = 0.082054;
Pc = 40.2;
Pc_atm = Pc * 9.86923;
Tc = 419.6;
P = 21 * 9.86923;
T = 415;
omega = 0.182;

a = 0.42748 * R^2 * Tc^2 / Pc_atm;
b = 0.08664 * R * Tc / Pc_atm;
alpha = (1 + (0.48 + 1.574 * omega - 0.176 * omega^2) * (1 - sqrt(T / Tc)))^2;
a_alpha = a * alpha;

V = R * T / P;

tol = 1e-6;
error = 1;
max_iter = 1000;
iter = 0;

errors = [];

while error > tol && iter < max_iter
    iter = iter + 1;
    V_new = R * T / P + b - a_alpha / (P * (V + b));
    error = abs(V_new - V);
    errors = [errors, error];
    V = V_new;
end

fprintf('The specific volume of 1-butene is %g liter/mol\n', V);

figure;
plot(1:iter, errors, '-o');
xlabel('Iteration');
ylabel('Error');
title('Error vs Iteration');

