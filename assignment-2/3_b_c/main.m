import algorithm.*
import math_function.*

clear


initialPoint = [-1.2; 1.0];

[gd_opt, gd_trace] = algorithm.optimization.SteepestDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[nw_opt, nw_trace] = algorithm.optimization.NewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[cg_opt, cg_trace] = algorithm.optimization.ConjugateGradientDescent.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);
[qn_opt, qn_trace] = algorithm.optimization.QuasiNewtonsMethod.findOptimalPoint(math_function.RosenbrockFunction, initialPoint);

% plot
hold on;
xAxis = [1 : 300];

p1 = semilogy(xAxis, generateGradientNormTrace(gd_trace), 'Color', [31, 138, 112] / 255.0, 'LineWidth', 2);
p2 = semilogy(xAxis, generateGradientNormTrace(nw_trace), 'Color', [41, 128, 185] / 255.0, 'LineWidth', 2);
p3 = semilogy(xAxis, generateGradientNormTrace(cg_trace), 'Color', [231, 76, 60] / 255.0, 'LineWidth', 2);
p4 = semilogy(xAxis, generateGradientNormTrace(qn_trace), 'Color', [253, 116, 0] / 255.0, 'LineWidth', 2);

legend([p1, p2, p3, p4], {'Steepest Descent', 'Newton''s Method', 'Conjugate Gradient', 'Quasi-Newton SR1'}, 'Location', 'northeast');

set(gca,'yscale', 'log');

hold off;
