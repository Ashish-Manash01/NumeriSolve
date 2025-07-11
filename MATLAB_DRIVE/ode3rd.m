function solveThirdOrderODE
    % Initial conditions [y(0), y'(0), y''(0)]
    y0 = [1; 0; -1]; 
    
    % Time span
    tspan = [0 10];
    
    % Solve using ode45
    [t, y] = ode45(@odeSystem, tspan, y0);
    
    % Plot results
    figure;
    plot(t, y(:, 1), '-r', 'DisplayName', 'y(t)');
    hold on;
    plot(t, y(:, 2), '--b', 'DisplayName', 'y''(t)');
    plot(t, y(:, 3), ':g', 'DisplayName', 'y''''(t)');
    xlabel('Time t');
    ylabel('Solutions');
    legend show;
    grid on;
    title('Solution of Third-Order ODE');
end

function dydt = odeSystem(t, y)
    % Define the system of first-order ODEs
    % y(1) = y, y(2) = y', y(3) = y''
    dydt = zeros(3, 1);
    dydt(1) = y(2);                      % y' = y2
    dydt(2) = y(3);                      % y'' = y3
    dydt(3) = 4*y(3) - y(2) + y(1) + t^2; % y''' = 4y'' - y' + y + t^2
end
