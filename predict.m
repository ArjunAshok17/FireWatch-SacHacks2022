function probability = predict(theta, X)
    % Function Description %
    % predict whether the label is 0 or 1 using learned logistic 
    % regression parameters theta
    % p = PREDICT(theta, X) computes the predictions for X using a 
    % threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

    m = size(X, 1); % Number of training examples
    probability = zeros(m, 1);

    %for j = 1 : size(X,2); %for all columns (for all features)
    %for i = 1 : m; %for all rows (for all examples)
        %if sigmoid(X*theta) >= 0.5, %if the output of the sigmoid function is greater than or equal to 0.5,
        % p(i,j) = 1; %then set that element of the matrix p in position (i,j) to 1,
    %  else %if the first if statement does not hold true (i.e. the output of the sigmoid function is < 0.5),
        % p(i,j) = 0; %then set that element of the matric p in the position (i,j) to 0
        %the else statement is not needed as p(i,j) is anyways equal to zero
    % endif
    %endfor
    %endfor

    % Optimized Implementation %
    g_z = sigmoid(X * theta);
    % p = (g_z >= 0.5); normally either yes or no, but we want specific probability
end