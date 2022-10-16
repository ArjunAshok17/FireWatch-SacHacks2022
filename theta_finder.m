function [theta_vals] = theta_finder(X, y, num_labels, lambda)
    % Function Description %
    %   Trains multiple logistic regression classifiers and returns all
    %   the classifiers in a matrix theta_vals, where the i-th row of all_theta 
    %   corresponds to the classifier for label i
    %
    %   Trains num_labels logistic regression classifiers and returns each of these
    %   classifiers in a matrix all_theta, where the i-th row of all_theta corresponds 
    %   to the classifier for label i

    % Some useful variables
    m = size(X, 1);
    n = size(X, 2);

    theta_vals = zeros(num_labels, n + 1);
    initial_theta = zeros(n + 1, 1); % sets initial theta

    options = optimset('GradObj', 'on', 'MaxIter', 50); % sets fminunc options

    for c = 1:num_labels
        theta_vals(c,:) = ... % all theta values in row c should be set to...
                fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
                    initial_theta, options);
    endfor
end