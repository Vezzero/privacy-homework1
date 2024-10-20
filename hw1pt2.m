filePath = 'C:/Users/samue/OneDrive/Desktop/heart.csv';
heartData = readtable(filePath, 'FileType', 'text', 'Delimiter', ',', 'ReadVariableNames', false);
heartData.Properties.VariableNames = {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall','output'};
variables = heartData{:, {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall','output'}};

covm = cov(variables);
U = chol(covm, 'lower');
disp('Cholesky Decomposition Check (U * U'') = Covariance Matrix:');
disp(U * U');

nRows = size(variables, 1);  % num data points
nCols = size(variables, 2);  % num variables

R = randn(nRows, nCols);  % random normal data (mean:0, std:1)
generated_heart = R * U';
disp('Size of generated data:');
disp(size(generated_heart));

generated_cov = cov(generated_heart);
disp('Covariance matrix of the generated data:');
disp(generated_cov);
disp('Original covariance matrix:');
disp(covm);