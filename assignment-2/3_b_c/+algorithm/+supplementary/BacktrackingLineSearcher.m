classdef BacktrackingLineSearcher < handle

  properties
    tolerance;
    shrinkFactor;
    initialStepLength;
  end

  methods
    % constructor
    function instance = BacktrackingLineSearcher(tolerance, shrinkFactor, initialStepLength)
      instance.tolerance = tolerance;
      instance.shrinkFactor = shrinkFactor;
      instance.initialStepLength = initialStepLength;
    end

    function stepLength = fitStepLength(instance, point, direction, mathFunction)
      % using Armijo–Goldstein condition:
      %   f(x + alpha·direction) <= f(x) + c·alpha·gradient·direction
      %   where c is some constant in [0, 1]

      tolerance = instance.tolerance; % c
      shrinkFactor = instance.shrinkFactor; % search fineness

      stepLength = instance.initialStepLength; % alpha
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

  end

end % class
