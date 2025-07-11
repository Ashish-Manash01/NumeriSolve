T = [0, 5, 10, 15, 20, 25, 30];
c = [14.6, 12.8, 11.3, 10.2, 9.09, 8.26, 7.56]; 

n = length(T);
X = [ones(n, 1), T', T'.^2];
Y = c';

b = (X' * X) \ (X' * Y);

disp('The 2nd-order polynomial coefficients are:');
disp(['a (T^2 coefficient) = ', num2str(b(3))]);
disp(['b (T coefficient) = ', num2str(b(2))]);
disp(['c (constant term) = ', num2str(b(1))]);

fprintf('The polynomial equation for dissolved oxygen concentration as a function of temperature is:\n');
fprintf('c(T) = %.4f*T^2 + %.4f*T + %.4f\n', b(3), b(2), b(1));

T_fit = linspace(min(T), max(T), 100);
c_fit = b(1) + b(2) * T_fit + b(3) * T_fit.^2;

figure;
plot(T, c, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
hold on;
plot(T_fit, c_fit, 'r-', 'LineWidth', 1.5);
xlabel('Temperature (°C)');
ylabel('Dissolved Oxygen Concentration (mg/L)');
title('2nd-Order Polynomial Regression for Dissolved Oxygen Concentration');
legend('Data', '2nd-Order Polynomial Fit');
grid on;
