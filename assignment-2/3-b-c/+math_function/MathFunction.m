classdef MathFunction < handle

  methods (Static)
    function value = valueAt(point)
      % should be overridden
      value = NaN;
    end

    function gradientVector = gradientVectorAt(point)
      % should be overridden
      gradientVector = NaN;
    end % gradient

    function hessianMatrix = hessianMatrixAt(point)
      % should be overridden
      hessianMatrix = NaN(1);
    end

  end
end
