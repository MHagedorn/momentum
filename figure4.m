% supplementary material on "Iteration Complexity of Fixed-Step Methods
% by Nesterov and Polyak for Convex Quadratic Functions" (2022)

% spectral radius of M^(i) as a function of alpha_i 
% just a zoom of Figure 3
clear all
clc

n    = 1000;          % partitions of axis
da   = 0.1/n;         % distances of values for alpha_i
a    = 0:da:0.1;      % values for alpha_i in (0,2] 
beta = [0.1,0.5,0.9]; % values for beta in [0,1)
z    = zeros(n+1,3);  % spectral radius of M^(i)

for k = 1:3
    b = beta(k);                     % values for beta 
    for i = 1:n+1
        z(k,i) = lambda_max(a(i),b); % spectral radius of M^(i)
    end
end

t = tiledlayout('flow','TileSpacing','compact');
nexttile
plot(a,z(1,:),'b',a,z(2,:),'--g',a,z(3,:),':r','LineWidth',1.5);
xlabel('$\alpha D_{i,i}$',  'Interpreter','latex', 'FontSize',17)
ylabel('$\rho\,(M^{(i)})$', 'Interpreter','latex', 'FontSize',17)
lgd = legend('\beta = 0.1', '\beta = 0.5', '\beta = 0.9');
lgd.Layout.Tile = 'east';
lgd.FontSize = 13;