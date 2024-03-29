function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
for i=1:m
    hthetax(i)=1/(1+exp(-X(i,:)*theta));
    temp(i) = -y(i)*log(hthetax(i))-(1-y(i))*log(1-hthetax(i));
    J=J+ temp(i);
end
reg=0;
for ii=2:size(theta)
    reg = reg + theta(ii)^2;
end
J=J/m + (lambda/(2*m))*reg;


%%%Gradient:
temp2=0;
for k=1:m
    temp2 = temp2 + (hthetax(k)- y(k))* X(k,1);
end
grad(1)= temp2 / m;


for j=2:size(theta)
    temp2=0;
    for k=1:m
        temp2 = temp2 + (hthetax(k)- y(k))* X(k,j);
    end
    grad(j)= temp2 / m + (lambda/m)*theta(j);
end
% =============================================================

end
