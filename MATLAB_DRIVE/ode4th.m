function solveFourthOrderODE
    % Initial conditions [y(0), y'(0), y''(0), y'''(0)]
    y0 = [0; 1; -1; 0]; 
    
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
    plot(t, y(:, 4), '-.k', 'DisplayName', 'y''''''(t)');
    xlabel('Time t');
    ylabel('Solutions');
    legend show;
    grid on;
    title('Solution of Fourth-Order ODE');
end

function dydt = odeSystem(t, y)
    % Define the system of first-order ODEs
    % y(1) = y, y(2) = y', y(3) = y'', y(4) = y'''
    dydt = zeros(4, 1);
    dydt(1) = y(2);                     % y' = y2
    dydt(2) = y(3);                     % y'' = y3
    dydt(3) = y(4);                     % y''' = y4
    dydt(4) = -2*y(4) + y(3) - 3*y(2) + y(1) + exp(-t); % y'''' = -2y''' + y'' - 3y' + y + e^(-t)
end
