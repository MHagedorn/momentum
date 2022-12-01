% supplementary material on "Iteration Complexity of Fixed-Step Methods
% by Nesterov and Polyak for Convex Quadratic Functions" (2022)

% spectral radius of M^(i) as a function of alpha_i and beta
clear all
clc

n     = 40;  % partitions of grid
da    = 2/n; % distances of values for alpha_i in (0,2] 
db    = 1/n; % distances of values for beta in [0,1)
[X,Y] = meshgrid(0:da:2, 0:db:1);
Z     = zeros(n+1,n+1); % spectral radius

for i = 1:n+1
    for j=1:n+1 
        Z(i,j)=lambda_max(X(i,j),Y(i,j)); % spectral radius
    end
end

surf(X,Y,Z) % surface plot for the spectral radius of M^(i)
xlabel('$\alpha D_{i,i}$',  'Interpreter','latex', 'FontSize',17)
ylabel('$\beta$',           'Interpreter','latex', 'FontSize',17)
zlabel('$\rho\,(M^{(i)})$', 'Interpreter','latex', 'FontSize',17)


