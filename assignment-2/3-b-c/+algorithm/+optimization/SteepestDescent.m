classdef SteepestDescent < handle

  properties (Constant)
    tolerance = 10^-3;
  end

  methods (Static)
    function [optimalPoint, gradients] = findOptimalPoint(mathFunction, initialPoint)
      optimalPoint = initialPoint;
      searchDirection = NaN;
      gradients = []; % initialize
      while true
        gradientVector = mathFunction.gradientVectorAt(optimalPoint);
        searchDirection = -gradientVector;
        stepLength = algorithm.supplementary.BacktrackingLineSearcher.fitStepLength(optimalPoint, searchDirection, mathFunction);
        if norm(stepLength * searchDirection) < algorithm.optimization.SteepestDescent.tolerance
          % check if converges
          break;
        end
        optimalPoint = optimalPoint + searchDirection * stepLength;
        gradients = [gradients gradientVector];
      end % while
      gradients = gradients';

    end % find optimal point
  end % static methods
end
