function [L, U, P] = lu_decomposition_with_pivoting(A)
% LU_DECOMPOSITION_WITH_PIVOTING performs LU decomposition with partial pivoting.
% Inputs:
%   A - The input square matrix.
% Outputs:
%   L - Lower triangular matrix.
%   U - Upper triangular matrix.
%   P - Permutation matrix.

[n, m] = size(A);
if n ~= m
    error('Input matrix A must be square.');
end

% Initialize matrices
P = eye(n); % Permutation matrix
L = zeros(n); % Lower triangular matrix
U = A; % Upper triangular matrix starts as A

for k = 1:n-1
    % Partial pivoting: Find the row with the largest pivot element
    [~, pivot_row] = max(abs(U(k:n, k)));
    pivot_row = pivot_row + k - 1;

    % Swap rows in U and P, and ensure L reflects the pivot
    if pivot_row ~= k
        U([k, pivot_row], :) = U([pivot_row, k], :);
        P([k, pivot_row], :) = P([pivot_row, k], :);
        if k > 1
            L([k, pivot_row], 1:k-1) = L([pivot_row, k], 1:k-1);
        end
    end

    % Perform elimination to form L and U
    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k);
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
    end
end

% Fill the diagonal of L with ones
L = L + eye(n);
end

% Example usage with output:
A = [2, -1, -2; -4, 6, 3; -4, -2, 8];
[L, U, P] = lu_decomposition_with_pivoting(A);

% Display results
disp('Input Matrix A:');
disp(A);
disp('Permutation Matrix P:');
disp(P);
disp('Lower Triangular Matrix L:');
disp(L);
disp('Upper Triangular Matrix U:');
disp(U);

% Verify the decomposition
disp('Verification (P*A = L*U):');
disp(P * A);
disp(L * U);
