classdef MathFunction < handle

  methods (Static)
    function val = valueAt(point)
      % should be overridden
      val = NaN;
    end

    function gradient = gradientVectorAt(point)
      % should be overridden
      gradient = NaN;
    end % gradient

    function hessian = hessianMatrixAt(point)
      % should be overridden
      hessian = NaN(1);
    end

  end
end
