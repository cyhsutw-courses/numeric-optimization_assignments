classdef QuasiNewtonsMethod < handle

  properties (Constant)
    tolerance = 10^-4;
  end

  methods (Static)

    function [optimalPoint, gradients] = findOptimalPoint(mathFunction, initialPoint)
      point = initialPoint;

      % initialize
      inversedHessianMatrix = eye(length(initialPoint));
      gradientVector = mathFunction.gradientVectorAt(point);
      lineSearcher = algorithm.supplementary.BacktrackingLineSearcher(0.0008, 0.98, 2.0);

      gradients = []; % initialize
      while norm(gradientVector) > algorithm.optimization.QuasiNewtonsMethod.tolerance
        searchDirection = - (inversedHessianMatrix * gradientVector); % - inv(H) * g
        stepLength = lineSearcher.fitStepLength(point, searchDirection, mathFunction);

        point = point + searchDirection * stepLength;

        % save trace
        gradients = [gradients gradientVector];

        % next gradient
        nextGradientVector = mathFunction.gradientVectorAt(point);
        s = searchDirection * stepLength; % s = x_k+1 - x_k
        y = nextGradientVector - gradientVector; % y = diff of gradients
        commonVector =  s - inversedHessianMatrix * y; % (s - By)

        bottom = (commonVector' * y);


        if abs(bottom) > 10^-8
          % SR1 update
          inversedHessianMatrix = inversedHessianMatrix + (commonVector * commonVector') / bottom;
        end

        gradientVector = nextGradientVector;

      end % while
      gradients = gradients';
      optimalPoint = point;
    end % find optimal point

  end % static methods

end % class
