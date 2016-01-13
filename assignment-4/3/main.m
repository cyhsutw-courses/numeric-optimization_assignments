A = [-2, -1; -3, -4; -1, -1; -1, 1];

b = [-1000; -2400; -700; -350];

c = [-8; -5];

x0 = [0; 0];
s0 = ones(length(b), 1);
[opt, walk_trace] = interiorPointMethodForLinearProgramming(c, A, b, x0, s0);

% plotting
hold on;

f1 = @(x) 1000 - 2 * x;
c1 = ezplot(f1, [280, 480]);

f2 = @(x) (2400 - 3 * x) / 4;
c2 = ezplot(f2, [-50, 400]);

% f3 = @(x) 700 - x;
% c3 = ezplot(f3, axisRange);

f4 = @(x) -1 * (350 - x);
c4 = ezplot(f4, [300, 500]);

aX = ezplot('0', [-50, 400]);

aY = plot([0, 0], [-50, 650]);

scatter(walk_trace(1, :), walk_trace(2, :), 'MarkerFaceColor', [0.91, 0.30, 0.23]);

[~, steps] = size(walk_trace);

indexes = (1 : steps) - 1;

labels = num2str(indexes', 't_%d');
text(walk_trace(1, :), walk_trace(2, :), labels, 'horizontal', 'left', 'vertical', 'bottom');

axis equal;
axis([-100, 550, -100, 700]);

xlabel('x_1');
ylabel('x_2');

title ''
set(c1, 'LineWidth', 1, 'Color', [0.2, 0.6, 0.86]);
set(c2, 'LineWidth', 1, 'Color', [0.2, 0.6, 0.86]);
set(c4, 'LineWidth', 1, 'Color', [0.2, 0.6, 0.86]);
set(aX, 'LineWidth', 1, 'Color', [0.2, 0.6, 0.86]);
set(aY, 'LineWidth', 1, 'Color', [0.2, 0.6, 0.86]);

hold off;