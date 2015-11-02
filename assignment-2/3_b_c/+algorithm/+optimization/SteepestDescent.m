classdef SteepestDescent < handle

  properties (Constant)
    tolerance = 10^-3;
  end

  methods (Static)

    function [optimalPoint, gradients] = findOptimalPoint(mathFunction, initialPoint)
      point = initialPoint;
      searchDirection = NaN;
      gradients = []; % initialize
      while true
        gradientVector = mathFunction.gradientVectorAt(point);

        searchDirection = -gradientVector;
        stepLength = algorithm.supplementary.BacktrackingLineSearcher.fitStepLength(point, searchDirection, mathFunction);

        if norm(stepLength * searchDirection) < algorithm.optimization.SteepestDescent.tolerance
          % check if converges
          break;
        end

        point = point + searchDirection * stepLength;
        gradients = [gradients gradientVector];
      end % while
      gradients = gradients';
      optimalPoint = point;
    end % find optimal point

  end % static methods
  
end
