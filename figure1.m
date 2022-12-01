% supplementary material on "Iteration Complexity of Fixed-Step Methods
% by Nesterov and Polyak for Convex Quadratic Functions" (2022)

% convergence behaviour of the momentum method
% plain method with momentum without stocahstic noise
% 2-d-example f(x) = 1/2*(x_1^2 + 100*x_2^2)
clear all
clc

v = [0.01, 1, 100]; % to generate different initial values
for i = 1:length(v)

kappa  = 100;        % condition number of Hessian matrix D
                     % cond(D) = D_max/D_min 
D      = [1; kappa]; % diagonal matrix, so that f(x) = 1/2*x^T*D*x
kmax   = 100;        % number if iterations
beta   = 0.85;       % must be in [0,1)
alpha  = 1.9/kappa;  % should be at most 2/kappa

x      = ones(2,kmax+2);  % x^k = x(:,k+2)
x(1,2) = v(i);            % initial value x(:,2)
xnorm  = zeros(1,kmax+2); % distances
m      = zeros(2,kmax+2); % moments

for k = 0:kmax-1
    m(:,k+2)   = beta*m(:,k+1) - D.*x(:,k+2);   % moments
    x(:,k+3)   = x(:,k+2) + alpha*m(:,k+2);     % iterates
    xnorm(k+3) = sqrt(x(1,k+3)^2+x(2,k+3)^2);   % distances
end

subplot(1,3,i)
semilogy((1:kmax),xnorm(3:end)/sqrt(2),'b') % logarithmic y axis
title(['for $x_1^0$ = ',num2str(v(i))],'Interpreter','latex','FontSize',17)
xlabel('iteration $k$',                'Interpreter','latex','FontSize',17)
ylabel('$\log(\|x^{k}-x^{opt}\|)$',    'Interpreter','latex','FontSize',17)
end