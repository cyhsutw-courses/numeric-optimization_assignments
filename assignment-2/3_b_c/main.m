import algorithm.*
import math_function.*

clear

initialPoint = [-1.2; 1.0];

[gd_opt, gd_tra] = algorithm.optimization.SteepestDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[nw_opt, nw_tra] = algorithm.optimization.NewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[cg_opt, cg_tra] = algorithm.optimization.ConjugateGradientDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[qn_opt, qn_tra] = algorithm.optimization.QuasiNewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
