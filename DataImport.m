function [X_train, Y_train, X_cv, Y_cv, X_test, Y_test] = DataImport(spreadsheet, workbook, X, Y)
  
  pkg load io % Including a library for using excel data

  X_sorted = xlsread(spreadsheet,workbook,X); % Creating matrices with excel data
  Y_sorted = xlsread(spreadsheet,workbook,Y);
  
  %%% Splitting into Train, Cross-Validation, and Test Sets %%%
    %% Randomizing the order so it isn't biased %%
    index = randperm(size(X_sorted,1)); % So the outputs still match the row
    
    X = X_sorted(index,:);      
    Y = Y_sorted(index,:); % If error in this line, check input dimensions
      
    %% Splitting %%
    [m,n] = size(X);
   
    X_train = zeros(round(.6 * m),n);
    X_cv = zeros(round(.2 * m),n);
    X_test = zeros(round(.2 * m),n);
    
    for i = 1:(round(.6 * m))
      X_train(i) = X(i);
    endfor
    for i = (round(.6* m) + 1):(round(.8 * m))
      X_cv(i) = X(i);
    endfor
    for i = (round(.8 * m) + 1):m
      X_test(i) = X(i);
    endfor
    
    [f,g] = size(Y);
   
    Y_train = zeros(round(.6 * f),g);
    Y_cv = zeros(round(.2 * f),g);
    Y_test = zeros(round(.2 * f),g);
    
    for i = 1:(round(.6 * f))
      Y_train(i) = Y(i);
    endfor
    for i = (round(.6 * f) + 1):(round(.8 * f))
      Y_cv(i) = Y(i);
    endfor
    for i = (round(.8 * Sf) + 1):f
      Y_test(i) = Y(i);
    endfor
  
endfunction