CA = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 1.0 1.3 2.0];
rA = [0.1 0.3 0.5 0.6 0.5 0.25 0.1 0.06 0.05 0.045 0.042];

CA0 = 1.3;
CAf = 0.3;

[~, idx_start] = min(abs(CA - CA0));
[~, idx_end] = min(abs(CA - CAf));

CA_selected = CA(idx_start:-1:idx_end);
rA_selected = rA(idx_start:-1:idx_end);

% Number of points and step size
n = length(CA_selected) - 1;
h = abs((CA_selected(end) - CA_selected(1)) / n);

% Trapezoidal rule implementation
trapz_integral = 0;
for i = 1:n
    trapz_integral = trapz_integral + 0.5 * h * (1 / rA_selected(i) + 1 / rA_selected(i+1));
end

% Simpson's rule implementation
if mod(n, 2) ~= 0
    n = n - 1;
    CA_selected = CA_selected(1:n+1);
    rA_selected = rA_selected(1:n+1);
end

h = abs((CA_selected(end) - CA_selected(1)) / n);
simp_integral = 1 / rA_selected(1) + 1 / rA_selected(end);
for i = 2:2:n
    simp_integral = simp_integral + 4 * (1 / rA_selected(i));
end
for i = 3:2:(n-1)
    simp_integral = simp_integral + 2 * (1 / rA_selected(i));
end
simp_integral = (h / 3) * simp_integral;

fprintf('Batch time using Trapezoidal rule: %f min\n', trapz_integral);
fprintf('Batch time using Simpson''s rule: %f min\n', simp_integral);
