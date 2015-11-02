classdef BacktrackingLineSearcher < handle

  methods (Static)

    function stepLength = fitStepLength(point, direction, mathFunction)
      % using Armijo–Goldstein condition:
      %   f(x + alpha·direction) <= f(x) + c·alpha·gradient·direction
      %   where c is some constant in [0, 1]

      tolerance = 0.15; % c
      shrinkFactor = 0.8; % search fineness

      stepLength = 1.0; % alpha
      while true
        nextValue = mathFunction.valueAt(point + stepLength * direction);
        boundValue = mathFunction.valueAt(point) + tolerance * stepLength * mathFunction.gradientVectorAt(point)' * direction;

        if nextValue <= boundValue
          break;
        else
          % shrink stepLength if needed
          stepLength = stepLength * shrinkFactor;
        end
      end % while

    end % determine step length

  end % static methods



end % class
