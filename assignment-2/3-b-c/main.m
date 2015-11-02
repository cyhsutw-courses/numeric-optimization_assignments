import algorithm.*
import math_function.*

initialPoint = [-1.2; 1.0];

[opt1, tra1] = algorithm.optimization.SteepestDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[opt2, tra2] = algorithm.optimization.NewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
