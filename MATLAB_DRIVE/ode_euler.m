f = @(t, ca) (10/3) - (ca * (0.1 + (1/3)));
tol = 1e-6;
h = 0.01;
n = 12 / h;

t0 = 0;
t1 = t0 + h;
c0 = 10;
c1 = c0 + (f(t0, c0) * h);

c_arr = zeros(1, n);
t_arr = zeros(1, n);
c_arr(1) = c0;
t_arr(1) = t0;
c_arr(2) = c1;
t_arr(2) = t1;
iter = 3;

while abs(c1 - c0) > tol && t1 <= 12
    t1 = t1 + h;
    t_arr(iter) = t1;
    c0 = c1;
    c1 = c0 + (f(t1, c0) * h);
    c_arr(iter) = c1;

    if abs(t1 - 12) < h / 2
        disp(["Concentration at 12s is ", c1])
    end
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
