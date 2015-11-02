import algorithm.*
import math_function.*

initialPoint = [-1.2; 1.0];

[opt, tra] = algorithm.optimization.SteepestDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[opt, tra] = algorithm.optimization.NewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[opt, tra] = algorithm.optimization.ConjugateGradientDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
