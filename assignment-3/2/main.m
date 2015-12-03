clear;

A = [2, 1; 3, 4; 1, 1; 1, -1];
A = [A, eye(4)];

b = [1000; 2400; 700; 350];

c = [-8; -5; 0; 0; 0; 0];

x0 = [0; 0];
x0 = [x0; b];

[solution, result, walk_trace] = mysimplex(c, A, b, x0);

% plotting
