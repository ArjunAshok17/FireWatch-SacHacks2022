function [theta, J_progress] = LogisticRegression(spreadsheet, workbook, X, Y, alpha, num_iters)
    
endfunction

function [J, grad] = lrCostFunction(theta, X, y, lambda)
    % variable declaration %
    m = length(y); % number of training examples
    J = 0;
    grad = zeros(size(theta));

    % calculating partial derivative
    z   = X * theta;   % m x 1 %placeholder variable z
    g_z = sigmoid(z);  % m x 1 %sigmoid hypothesis definition
    
    reg_term = (lambda/(2 * m)) * sum(theta(2:end) .^ 2); %regularization term as per definition (reference costFunctionReg (week 3) for details
    
    J = (1 / m) * sum((-y .* log(g_z)) - ((1 - y) .* log(1 - g_z))) + reg_term; % scalar %defining sigmoid cost function with reg_term added on
    
    grad(1) = (1 / m) * (X(:, 1)' * (g_z - y)); % 1 x 1 %set grad = partial derivatives of the cost for theta zero only
    grad(2:end) = (1 / m) * (X(:, 2:end)' * (g_z - y)) + (lambda / m) * theta(2:end);  % n x 1 %set grad = partial derivatives of the cost for theta values after zero till theta n + 1 

    grad = grad(:);
endfunction

function g = sigmoid(z)
    %SIGMOID Compute sigmoid functoon
    %   J = SIGMOID(z) computes the sigmoid of z.
    g = 1.0 ./ (1.0 + exp(-z));
endfunction