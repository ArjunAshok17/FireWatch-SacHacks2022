function [theta, J_progress] = LinearRegression(spreadsheet, workbook, X, Y, alpha, num_iters)
    % Import Data %
    %[X_train, Y_train, X_cv, Y_cv, X_test, Y_test] = DataImport(spreadsheet, workbook, X, Y);
    pkg load io
    
    X = xlsread(spreadsheet, workbook, X);
    Y = xlsread(spreadsheet, workbook, Y);
    
    X = X .- 43843; % Dates are stored as days after 1/1/1900, so reduce each one to be days after initial date (43843 days)
    
    X = [ones(size(X,1),1) X]; % Bias term for matrix multiplication
    
    % Normalize Features %
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));
    
    mu = mean(X);
    sigma = std(X);
    X_norm = (X - mu) ./ sigma;
    
    X = X_norm;
    
    % Define Variables %
    theta = rand(1,2); % 1x2 vector randomly initialized; theta_0 and theta_1
    m = length(Y);
    J_progress = zeros(num_iters,1); % To track the history of cost function (make sure it's reducing cost)
    
    % Gradient Descent %
    for iter = 1:num_iters
        expectedVal = X * theta';
        error = expectedVal - Y;
        
        for j = 1:length(theta)
            theta(j) = theta(j) - ((alpha / m) * sum(X' * error));
        endfor
        
        %theta = theta - ((alpha/m) * (X' * error));
        
        J_progress(iter) = (1/(2 * m)) * sum(((X * theta') - Y) .^ 2); % Calculate and save cost
        %J_progress(iter) = computeCost(X, Y, theta);
        % Scalar          = Scalar      * Scalar Sum of (((m x 1 * 1 x 2) - m x 1) .^ 2)
        %                                                 m x 2 - m x 1
    endfor
    
    % Check Progress %
    J_progress
    plot(J_progress);
    theta % Display theta values
    
    plot(X(:, 2), Y ,"marker","*");
    hold on;
    plot(X(:, 2), X * theta');
    hold off;
    xlabel("Date");
    ylabel("Percent Risk of Fire");
    title("FireWatch Predictive Analysis");
endfunction