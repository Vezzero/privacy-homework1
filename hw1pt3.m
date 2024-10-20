filePath = 'C:/Users/samue/OneDrive/Desktop/heart.csv';
heartData = readtable(filePath, 'FileType', 'text', 'Delimiter', ',', 'ReadVariableNames', false);
heartData.Properties.VariableNames = {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall','output'};

variables = heartData{:, {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall'}};
means = mean(variables);
proportion = 0.5;
[nRows, nCols] = size(variables);
sampled = rand(nRows, nCols) < proportion;

% call the variables
variables_bi = variables;

for col = 1:nCols
    variables_bi(sampled(:, col), col) = means(col);
end

disp('The Modified Data (the first 5 rows):');
disp(variables_bi(1:5, :));

disp('The Original Data (the first 5 rows):');
disp(variables(1:5, :));
