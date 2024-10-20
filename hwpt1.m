filePath = 'C:/Users/samue/OneDrive/Desktop/heart.csv';

heartData = readtable(filePath, 'FileType', 'text', 'Delimiter', ',', 'ReadVariableNames', false);

disp(heartData(1:5,:))

heartData.Properties.VariableNames = {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall','output'};
variables = heartData{:, {'age', 'sex', 'cp', 'trtbps', 'chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall','output'}};

corrMatrix = corrcoef(variables);  % plot the correlation matrix
heatmap(corrMatrix);

title('Correlation Heatmap');
xlabel('Variables');
ylabel('Variables');

% 'variables' contains the selected data (e.g., from the heart.csv dataset)
% variance (std^2) of the selected variables
sigmas2 = var(variables);
disp('Variance values (sigmas2):');
disp(sigmas2);

alpha = 1.4; % defined this value for alpha
scaled_sigmas2 = sigmas2 * alpha;
disp('Scaled variance values (scaled_sigmas2):');
disp(scaled_sigmas2);

% the size of the variables
[nRows, nCols] = size(variables);
% generated random noise using mean 0 and standard deviation for each column
% replicate the standard deviations across rows to match the dimensions
std_dev_matrix = repmat(sqrt(scaled_sigmas2), nRows, 1);
noise = normrnd(0, std_dev_matrix);
noised_hdf = variables + noise;
disp('Noised data (first 5 rows):');
disp(noised_hdf(1:5, :));
disp('First 5 rows of the variables:');
disp(variables(1:5, :));

% correlation matrix of the noised data
corrMatrix = corrcoef(noised_hdf);
figure;
heatmap(corrMatrix);

title('Correlation Heatmap of Noised Data');
xlabel('Variables');
ylabel('Variables');




