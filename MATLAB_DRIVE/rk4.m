f = @(t, ca) (10/3) - (ca * (0.1 + (1/3)));
tol = 1e-6;
h = 0.01;
n = 12 / h;

t0 = 0;
c0 = 10;

c_arr = zeros(1, n);
t_arr = zeros(1, n);
c_arr(1) = c0;
t_arr(1) = t0;

iter = 2;

while t0 <= 12
    k1 = h * f(t0, c0);
    k2 = h * f(t0 + h / 2, c0 + k1 / 2);
    k3 = h * f(t0 + h / 2, c0 + k2 / 2);
    k4 = h * f(t0 + h, c0 + k3);
    
    c1 = c0 + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    
    c_arr(iter) = c1;
    t_arr(iter) = t0 + h;
    
    if abs(c1 - c0) < tol
        disp(['Steady-state concentration reached at time ', num2str(t_arr(iter)), ' s: ', num2str(c1)]);
        break;
    end
    
    if abs(t0 + h - 12) < h / 2
        disp(["Concentration at 12s is ", c1])
    end
    
    c0 = c1;
    t0 = t0 + h;
    iter = iter + 1;
end

c_arr = c_arr(1:iter-1);
t_arr = t_arr(1:iter-1);

disp(['Final steady-state concentration: ', num2str(c1)])

plot(t_arr, c_arr, '-o', 'MarkerSize', 4, ...
    'MarkerEdgeColor', 'blue', 'MarkerFaceColor', [0.6 0.8 1]);
xlabel('Time (s)');
ylabel('Concentration');
title('Concentration vs. Time');
