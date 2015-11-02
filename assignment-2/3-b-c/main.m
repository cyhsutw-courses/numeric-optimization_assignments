import algorithm.*
import math_function.*

initialPoint = [-1.2; 1.0];

[opt, tra] = algorithm.optimization.SteepestDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
