function y = lambda_max(a,b)

% supplementary material on "Iteration Complexity of Fixed-Step Methods
% by Nesterov and Polyak for Convex Quadratic Functions" (2022)

% to calculate the spectral radius of M^(i) for figures 2, 3 and 4,
% i.e. the maximum absolute eigenvalue of M = [0, 1; -b, 1-a+b]

bi = 1-a+b;
y  = sqrt(b); % spectral radius in case of beta_i^2 < 4*beta

if 4*b < bi^2
    y = 0.5*(abs(bi)+(bi^2-4*b)^0.5);
end

end
