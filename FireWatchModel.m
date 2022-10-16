function fire_threat = FireWatchModel(dataset, wb, X, Y, date)
    % Function Inputs Defining %
    % ======================== %
    % dataset   -> name of the spreadsheet where the dataset is stored
    % wb        -> name of the workbook where the data is stored
    % X         -> range of the input (weather) data in Excel
    % Y         -> range of the actual output (fire risk) data in Excel
    % date      -> date being considered, entered as number of days after 01/01/1900 like in excel

    % Function Variables Defining %
    % =========================== %
    % alpha     -> learning rate for fine-tuning weights
    % num_iters -> number of iterations the gradient descent model will do
    % lambda    -> regularization constant, determines the fitting of the model to dataset
    % these values will vary for the linear vs logistic regression models
    % and are manually set constants based on experimentation with the dataset
    alpha_1 = .1;
    num_iters_1 = 500;

    alpha_2 = .1;
    num_iters_2 = 500;

    lambda = .4;

    % Overall FireThreat Trend %
    % call the LinearRegression function to gauge overall trend in fire risk
    LinearRegression(dataset, wb, X, Y, alpha_1, num_iters_1);

    % convert date to same format for using linear regression model
    date = date - 43843;

    % calculate overall trend using the output from linear regression model
    fire_threat_offset = theta_lin(0) + theta_lin(1) * date;

    % Calculate FireThreat %
    LogisticRegression(dataset, wb, X, Y, alpha_2, num_iters_2);

    % Output FireThreat %

endfunction

function [theta_lin] = LinearRegression(spreadsheet, workbook, X, Y, alpha, num_iters)
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
    theta_lin = rand(1,2); % 1x2 vector randomly initialized; theta_0 and theta_1
    m = length(Y);
    J_progress = zeros(num_iters,1); % To track the history of cost function (make sure it's reducing cost)
    
    % Gradient Descent %
    for iter = 1:num_iters
        expectedVal = X * theta';
        error = expectedVal - Y;
        
        for j = 1:length(theta)
            theta_lin(j) = theta_lin(j) - ((alpha / m) * sum(X' * error));
        endfor
        
        %theta = theta - ((alpha/m) * (X' * error));
        
        J_progress(iter) = (1/(2 * m)) * sum(((X * theta') - Y) .^ 2); % Calculate and save cost
        %J_progress(iter) = computeCost(X, Y, theta);
        % Scalar          = Scalar      * Scalar Sum of (((m x 1 * 1 x 2) - m x 1) .^ 2)
        %                                                 m x 2 - m x 1
    endfor
    
    % Outputting Data %
    % J_progress
    % plot(J_progress);
    % theta % Display theta values
    
    % plot(X(:, 2), Y ,"marker","*");
    % hold on;
    % plot(X(:, 2), X * theta');
    % hold off;
    % xlabel("Date");
    % ylabel("Percent Risk of Fire");
    % title("FireWatch Predictive Analysis");
endfunction