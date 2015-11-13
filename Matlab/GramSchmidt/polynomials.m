%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function polynomials.m
%
% Computes the vector of the e-coefficients of the Gram-Schmidt polynomials
% Inputs:
% highest_order    Highest order of the calculated polynomials
% Outputs:
% A vector of vectors containing the coefficients.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = polynomials(highest_order, xrange)
  ones = generate_ones(highest_order);
  coefficients = zeros(highest_order);
  auto_product = zeros([1 highest_order]);

  for order = 1:highest_order
    coefficients(order, highest_order-order+1) = 1;
    for power = 1:order-1
      product = inner_product(ones(order,:),coefficients(order-power,:),xrange);
      norm_product = product/auto_product(order-power);
      coefficients(order, :) = coefficients(order, :) + (-1)*norm_product*coefficients(order-power, :);
    end
    auto_product(order) = inner_product(coefficients(order,:), coefficients(order,:), xrange);
  end
  
  for order = 1:highest_order
    display(order);
    coefficients(order, :) = coefficients(order,:)/sqrt(auto_product(order));
  end
      
