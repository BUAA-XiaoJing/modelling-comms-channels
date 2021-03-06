%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FITTING_ERROR(fo, x, n, params)
%
% Computes the error between the supplied dataset points and the Laguerre
% fit being investigated. 
% The function is used in conjunction with the fminsearch which 
% simultaneously computes the alpha and x-scaling coefficients, trying to
% minimize the fitting_error.
%
% Inputs:   fo       values of the function being fitted
%           x        domain of the function being fitted
%           n        highest order of the Laguerre polynomial being used
%           params   vector containing the alpha and x-scaling coefficients
%                    being optimised
% 
% Outputs:  error    single numerical value of the difference between the
%                    Laguerre fit and the dataset.
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function error = fitting_error(fo, x, n, params)

  alpha = params(1); % Extracting the alpha coefficient
  lambda = params(2); % Extracting the lambda coefficient
  
  % Computing the scaled domain. We shift the x values to the left as much
  % as possible and scale it by a chosen factor
  xscaled = lambda*(x-x(1))/(x(length(x))-x(1));
  laguerre = laguerre_fit(fo, xscaled, n, alpha);
  
  % Computing the error
  error = trapz(x, (laguerre-fo).^2);
  
end