classdef RosenbrockFunction < math_function.MathFunction

  methods (Static)

    function val = value_at(point)
      % function definition
      % f(x, y) = (1 − x)² + 100(y − x²)²
      x = point(1);
      y = point(2);
      val = (1 - x)^2 + 100 * (y - x^2)^2;
    end % function val

    function gradient = gradient_vector_at(point)
      % gradient formula
      % ∇f(x, y) = [
      %   400x³ - 400xy + 2x - 2;
      %   200(y - x²)
      % ]
      x = point(1);
      y = point(2);

      gradient = [
        400 * x * (x^2 - y) + 2 * x - 2;
        200 * (y - x^2)
      ]
    end % gradient

    function hessian = hessian_matrix_at(point)
      % hessian matrix formula
      % H(x, y) = [
      %   1200x² - 400y + 2, -400x;
      %   -400x,           , 200
      % ]

      x = point(1);
      y = point(2);

      hessian = [
        1200 * x^2 - 400 * y + 2, -400 * x;
        -400 * x, 200
      ];
    end % hessian

  end % static methods
end
