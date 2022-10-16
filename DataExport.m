function DataExport(spreadsheetIn, workbookIn, spreadsheetOut, X, Y)
  [X_train, Y_train, X_cv, Y_cv, X_test, Y_test] = DataImport(spreadsheetIn, workbookIn, X, Y);
   
  %plot(X, Y); % If data is plottable
  
  %X_sorted % Displaying matrices
  %X 
  %Y_sorted
  %Y
  
  %% Exporting to Excel %%
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',X_train,'X_train');
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',Y_train,'Y_train');
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',X_cv,'X_cv');
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',Y_cv,'Y_cv');
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',X_test,'X_test');
  rstatus = xlswrite('DataImport-ExportedMatrices.xlsx',Y_test,'Y_test');
endfunction
