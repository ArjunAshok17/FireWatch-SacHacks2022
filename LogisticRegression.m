function fire_risk = LogisticRegression(spreadsheet, workbook, X, Y, alpha, num_iters, lambda)
    % Import Data %
    pkg load io
    
    X = xlsread(spreadsheet, workbook, X);
    Y = xlsread(spreadsheet, workbook, Y);
    
    X = X .- 43831; % Dates are stored as days after 1/1/1900, so reduce each one to be days after initial date (43831 days)
    
    X = [ones(size(X,1),1) X]; % Bias term for matrix multiplication

    % Normalize Features %
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));
    
    mu = mean(X);
    sigma = std(X);
    X_norm = (X - mu) ./ sigma;
    
    X = X_norm;

    % Gradient Descent %
    theta_log = theta_finder(X, Y, columns(X), lambda);
    probability = predict(theta_log, X);

    % update fire risk
    fire_risk = probability;
endfunction