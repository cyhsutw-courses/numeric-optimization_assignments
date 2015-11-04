classdef SteepestDescent < handle

  properties (Constant)
    tolerance = 10^-4;
  end

  methods (Static)

    function [optimalPoint, gradients] = findOptimalPoint(mathFunction, initialPoint)
      point = initialPoint;
      searchDirection = NaN;

      lineSearcher = algorithm.supplementary.BacktrackingLineSearcher(0.1, 0.8, 1.0);

      gradients = []; % initialize
      while true
        gradientVector = mathFunction.gradientVectorAt(point);

        searchDirection = -gradientVector;
        stepLength = lineSearcher.fitStepLength(point, searchDirection, mathFunction);

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
