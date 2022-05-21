clear ; close all; clc

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% ==================== Segmetation Plotting ====================

fprintf(['Plotting Audio Embedding data\n']);

plotData(X, y);
hold on;

xlabel('Audio Segmetation')
ylabel('Image particle distribution')


legend('Undisturbed', 'Disturbed')
hold off;

fprintf('\nStage 1 completed. Press enter to continue.\n');
pause;
%% ============ Logistic Regression ============
%  Setup the data matrix
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Compute and display initial and final values of the gradient
[cost, grad] = audioFunction(initial_theta, X, y);

fprintf('Difference in value at initial theta (zeros): %f\n', cost);
fprintf('Expected difference (approx): 0.693\n');
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
fprintf('Expected gradients (approx):\n -0.1000\n -12.0092\n -11.2628\n');

% Compute and display gradient with non-zero theta
test_theta = [-24; 0.2; 0.2];
[cost, grad] = audioFunction(test_theta, X, y);

fprintf('\nValue at test theta: %f\n', cost);
fprintf('Expected (approx): 0.218\n');
fprintf('Gradient at test theta: \n');
fprintf(' %f \n', grad);
fprintf('Expected gradients (approx):\n 0.043\n 2.566\n 2.647\n');

fprintf('\nStage 2 complete. Press enter to continue.\n');
pause;


%% ============= Part 3: Optimizing using fminunc  =============
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
[theta, cost] = ...
	fminunc(@(t)(audioFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Value at theta found by fminunc: %f\n', cost);
fprintf('Expected (approx): 0.203\n');
fprintf('theta: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');

% Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Original Score score')
ylabel('Post Watermarking score')

% Specified in plot order
legend('Undisturbed', 'Disturbed')
hold off;

fprintf('\nStage 3 complete. Press enter to continue.\n');
pause;

%% ============== Part 4: Training Set ==============
prob = sigmoid([1 45 85] * theta);
fprintf(['For a disturbed value between 45 and 85, we predict the watermarking as successful ' ...
         'probability of %f\n'], prob);
fprintf('Expected value: 0.775 +/- 0.002\n\n');

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');

