ca = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 1.0, 1.3, 2.0];
ra = [0.1, 0.3, 0.5, 0.6, 0.5, 0.25, 0.1, 0.06, 0.05, 0.045, 0.042];

log_ca = log(ca);
log_ra = log(ra);

n = length(log_ca);
sum_x = sum(log_ca);
sum_y = sum(log_ra);
sum_xy = sum(log_ca .* log_ra);
sum_x_squared = sum(log_ca .^ 2);

slope = (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x^2);
intercept = (sum_y - slope * sum_x) / n;

n = slope;
ln_k = intercept;
k = exp(ln_k);

disp(['Reaction order (n): ', num2str(n)]);
disp(['Reaction rate constant (k): ', num2str(k)]);

figure;
plot(log_ca, log_ra, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
hold on;

fitted_line = slope * log_ca + intercept;
plot(log_ca, fitted_line, 'r-', 'LineWidth', 1.5);

xlabel('ln(c_a)');
ylabel('ln(r_a)');
title('Linear Regression for Reaction Order and Rate Constant');
legend('Data', 'Linear Fit');
grid on;
