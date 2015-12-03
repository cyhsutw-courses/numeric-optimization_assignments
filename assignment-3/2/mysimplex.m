function [x_star, result, walk_trace] = mysimplex(c, A, b, x0)

  [numberOfConstraints, numberOfVars] = size(A);
  numberOfOriginalVars = numberOfVars - numberOfConstraints;
  indexesOfNonBasicVars = 1 : numberOfOriginalVars;
  indexesOfBasicVars = numberOfOriginalVars + 1 : numberOfVars;

  x = x0;

  if ~all(A * x <= b) || ~all(x >= 0)
    x_star = NaN;
    result = 2; % insfeasible
    return;
  end

  walk_trace = [x];

  while true
    matrixForNonBasicVars = A(:, indexesOfNonBasicVars);
    matrixForBasicVars = A(:, indexesOfBasicVars);

    nonBasicVector = x(indexesOfNonBasicVars);
    basicVector = x(indexesOfBasicVars);

    coeffForNonBasicVars = c(indexesOfNonBasicVars);
    coeffForBasicVars = c(indexesOfBasicVars);

    pricingVector = coeffForNonBasicVars - matrixForNonBasicVars' * (matrixForBasicVars' \ coeffForBasicVars);

    if all(pricingVector >= 0)
      x_star = x;
      result = 0; % solved
      break;
    end

    indexOfFirstNegativeElementInPricingVector = find(pricingVector < 0);
    indexOfFirstNegativeElementInPricingVector = indexOfFirstNegativeElementInPricingVector(1);

    selectedIndex = indexesOfNonBasicVars(indexOfFirstNegativeElementInPricingVector);

    searchDirection = matrixForBasicVars \ A(:, selectedIndex);

    if all(searchDirection <= 0)
      x_star = NaN;
      result = 1; % unbounded
      break;
    end

    [minRatio, indexOfMinRatio] = ratio(searchDirection, basicVector);

    unitVector = zeros(length(nonBasicVector), 1);
    unitVector(indexOfFirstNegativeElementInPricingVector) = 1;

    x([indexesOfBasicVars'; indexesOfNonBasicVars']) = [basicVector; nonBasicVector] + minRatio * [-1 * searchDirection; unitVector];

    pivotIndex = indexesOfBasicVars(indexOfMinRatio);

    indexesOfBasicVars = union(setdiff(indexesOfBasicVars, pivotIndex), selectedIndex);
    indexesOfNonBasicVars = union(setdiff(indexesOfNonBasicVars, selectedIndex), pivotIndex);

    walk_trace = [walk_trace, x];
  end
end


function [min_ratio, index_of_min_ratio] = ratio(searchDirection, basicVector)

  min_ratio = inf;
  index_of_min_ratio = 0;

  for i = 1 : length(searchDirection)
    if searchDirection(i) > 0
      ratio = basicVector(i) / searchDirection(i);
      if ratio < min_ratio
        min_ratio = ratio;
        index_of_min_ratio = i;
      end
    end
  end

end
