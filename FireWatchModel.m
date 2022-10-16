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
    date = date - 43831;

    % calculate overall trend using the output from linear regression model
    fire_threat_offset = theta_lin(0) + theta_lin(1) * date;

    % Calculate FireThreat %
    LogisticRegression(dataset, wb, X, Y, alpha_2, num_iters_2);

    % Output FireThreat %
    fire_threat
endfunction