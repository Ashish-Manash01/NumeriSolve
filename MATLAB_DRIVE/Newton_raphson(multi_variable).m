function [x, iter] = newtonRaphsonMulti(F, J, x0, tol, maxIter)
    % Newton-Raphson Method for Multiple Variables
    % Inputs:
    %   F - Function handle that returns a column vector of equations
    %   J - Function handle that returns the Jacobian matrix
    %   x0 - Initial guess (column vector)
    %   tol - Tolerance for convergence
    %   maxIter - Maximum number of iterations
    %
    % Outputs:
    %   x - Solution vector
    %   iter - Number of iterations performed
    
    x = x0; % Initial guess
    iter = 0; % Iteration counter
    
    while iter < maxIter
        % Evaluate function and Jacobian
        Fx = F(x);
        Jx = J(x);
        
        % Check if Jacobian is singular
        if det(Jx) == 0
            error('Jacobian is singular at iteration %d.', iter);
        end
        
        % Update step
        dx = -Jx \ Fx;
        x = x + dx;
        
        % Check for convergence
        if norm(dx, inf) < tol
            fprintf('Converged in %d iterations.\n', iter + 1);
            return;
        end
        
        iter = iter + 1;
    end
    
    % If max iterations reached without convergence
    warning('Maximum iterations reached without convergence.');
end
% Define the system of equations
F = @(x) [x(1)^2 + x(2)^2 - 1; x(1) - x(2)];

% Define the Jacobian matrix
J = @(x) [2*x(1), 2*x(2); 1, -1];

% Initial guess
x0 = [0.5; 0.5];

% Tolerance and maximum iterations
tol = 1e-6;
maxIter = 100;

% Solve using Newton-Raphson method
[x, iter] = newtonRaphsonMulti(F, J, x0, tol, maxIter);

% Display results
disp('Solution:');
disp(x);
disp('Iterations:');
disp(iter);
