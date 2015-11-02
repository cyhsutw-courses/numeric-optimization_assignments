classdef Rosenbrock < handle

  method(static)

    function val = function_value_at(point)
      % function definition
      % f(x, y) = (1 − x)² + 100(y − x²)²
      x = point(1);
      y = point(2);
      val = (1 - x)^2 + 100 * (y - x^2)^2;
    end % function val


    function gradient = gradient_vector_at(point)
      % gradient formula
      % ∇f(x, y) = 

    end % gradient

  end % static methods
end
