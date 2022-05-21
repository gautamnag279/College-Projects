function plotData(X, y)
% PLOTDATA Plots the data points X and y into a new figure. 
% It willplots the data points with + for the positive values
% and o for the negative values. X is assumed to be a Mx2 matrix.

figure; hold on;

% Ploting the positive and negative values on a
% 2D plot, using the option 'k+' for the positive
% values and 'ko' for the negative values.
%

pos = find(y == 1); neg = find(y == 0);

plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, ...
'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);

hold off;

end
