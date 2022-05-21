function [J, grad] = audioFunction(theta, X, y)
m = length(y);
J = 0;
grad = zeros(size(theta));
h_theta = sigmoid(X*theta);
J = (1 / m) * ((-y' * log(h_theta)) - (1 - y)' * log(1 - h_theta));
grad = (1 / m) * (h_theta - y)' * X;

end
