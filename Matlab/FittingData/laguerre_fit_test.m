%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% laguerre_fit_test.m
% Calculates the coefficients of the Laguerre fit for a randomized function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

[f0, x] = exp_data(2, 0, 10000, 100);
laguerre = laguerre_fit(f0,x,1,0);

estimated_mean = trapz (x , x .* f0 );
parameterised_fit = (1/estimated_mean)*exp(-x/estimated_mean);

error = trapz(x, (laguerre - parameterised_fit).^2);
display(error);

hold on;
set(gca, 'FontSize', 18);
plot(x, parameterised_fit, '-', 'LineWidth',2, 'Color', 'blue'); hold on; 
xlabel('x'); ylabel('Normalised polynomials values');
print('-depsc', 'gm.eps'); % Save diagram as colour postscript