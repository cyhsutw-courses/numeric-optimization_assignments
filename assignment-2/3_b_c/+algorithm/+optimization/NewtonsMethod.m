classdef NewtonsMethod < handle

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
        hessianMatrix = mathFunction.hessianMatrixAt(point);

        searchDirection = - (hessianMatrix \ gradientVector); % - inv(H) * g
        stepLength = algorithm.supplementary.BacktrackingLineSearcher.fitStepLength(point, searchDirection, mathFunction);

        if norm(stepLength * searchDirection) < algorithm.optimization.NewtonsMethod.tolerance
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

end % class
