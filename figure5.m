% supplementary material on "Iteration Complexity of Fixed-Step Methods
% by Nesterov and Polyak for Convex Quadratic Functions" (2022)

% assume M^(i) diagonalizable, i.e. gamma_i nonzero
% condition number of transmformation matrices S
clear all 
clc

n     = 101; % partitions of grid
da    = 2/n; % distances of values for alpha_i in (0,2] 
db    = 1/n; % distances of values for beta in [0,1)
[X,Y] = meshgrid(eps:da:2,0:db:1);
con   = zeros(n+1,n+1); % condition number

for i = 1:n+1
for j=1:n+1
        
    a  = X(i,j);    % alpha_i
    b  = Y(i,j);    % beta
    bi = 1 + b - a; % beta_i

    % eigenvalues and eigenvectors of S
    gam = sqrt(bi^2 - 4*b); % gamma_i
    ew1 = 0.5*(bi + gam);   % lambda_+  
    ew2 = 0.5*(bi - gam);   % lambda_-
    ev1 = [1;ew1];          % v_+
    ev2 = [1;ew2];          % v_-

    % eigenvalues of S^H*S
    if bi^2 > 4*b % case of real gamma_i
        mu1 = 1 + 1/4*(bi^2+gam^2) + 1/2*sqrt(bi^2*gam^2+4*(1+b)^2);
        mu2 = 1 + 1/4*(bi^2+gam^2) - 1/2*sqrt(bi^2*gam^2+4*(1+b)^2);
    else % case of purely imaginary gamma_i
        mu1 = 1+b + abs(1+ew1^2);
        mu2 = 1+b - abs(1+ew1^2);
    end

    con(i,j) = max([mu1,mu2])/min([mu1,mu2])^.5; % condition number

end
end

surf(X,Y,con) % surface plot for min{cond(S^(i)), 20}
xlabel('$\alpha D_{i,i}$', 'Interpreter','latex', 'FontSize',17)
ylabel('$\beta$',          'Interpreter','latex', 'FontSize',17)
zlabel('cond($S$)',        'Interpreter','latex', 'FontSize',17)
zlim([0,20]) % cut off at 20

figure
as = 0:0.001:2;           % alpha_i
plot(as, (1-sqrt(as)).^2) % zeros of the terms gamma_i
xlabel('$\alpha D_{i,i}$', 'Interpreter','latex', 'FontSize',17)
ylabel('$\beta$',          'Interpreter','latex', 'FontSize',17)