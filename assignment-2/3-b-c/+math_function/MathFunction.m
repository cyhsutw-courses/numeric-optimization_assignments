classdef MathFunction < handle

  methods (Static)
    function val = value_at(point)
      % should be overridden
      val = NaN;
    end

    function gradient = gradient_vector_at(point)
      % should be overridden
      gradient = NaN;
    end % gradient

    function hessian = hessian_matrix_at(point)
      % should be overridden
      hessian = NaN(1);
    end

  end
end
