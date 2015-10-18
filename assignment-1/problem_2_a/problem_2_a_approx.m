function problem_2_a_approx()

% target function
% f = ezplot('x^4-2*x^2+3*x^2-4*x+5', [-2, 2])
% set(f, 'Color', 'red')
hold on;

space = [-1.3, 1.3]

% interpolation, alpha = 1
alpha = 1

A = [alpha*alpha, -alpha, 1; 0, 0, 1; alpha*alpha, alpha, 1]
B = [poly_f(-alpha); poly_f(0); poly_f(alpha)]

x = A\B

g5 = sprintf('(%f)*x^2+(%f)*x+(%f)', x(1), x(2), x(3))

h = ezplot(g5, space)
set(h, 'Color', [30/255.0, 78/255.0, 144/255.0])

% interpolation, alpha = 0.5
alpha = 0.5

A = [alpha*alpha, -alpha, 1; 0, 0, 1; alpha*alpha, alpha, 1]
B = [poly_f(-alpha); poly_f(0); poly_f(alpha)]

x = A\B

g5 = sprintf('(%f)*x^2+(%f)*x+(%f)', x(1), x(2), x(3))


h = ezplot(g5, space)
set(h, 'Color', [8/255.0, 144/255.0, 76/255.0])

% interpolation, alpha = 0.25
alpha = 0.25

A = [alpha*alpha, -alpha, 1; 0, 0, 1; alpha*alpha, alpha, 1]
B = [poly_f(-alpha); poly_f(0); poly_f(alpha)]

x = A\B

g5 = sprintf('(%f)*x^2+(%f)*x+(%f)', x(1), x(2), x(3))

h = ezplot(g5, space)
set(h, 'Color', [255/255.0, 109/255.0, 51/255.0])

% taylor (Newton)
g = ezplot('3*x^2-4*x+5', space)
set(g, 'Color', [221/255.0, 75/255.0, 57/255.0], 'LineWidth', 2)

title('')
xlabel('x')
ylabel('f(x)')

legend('Interpolation with \alpha = 1.0', 'Interpolation with \alpha = 0.5', 'Interpolation with \alpha = 0.25', 'Second order Taylor series')
end


function val = poly_f(x)
    val = x^4-2*x^3+3*x^2-4*x+5
end
