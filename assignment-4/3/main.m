A = [-2, -1; -3, -4; -1, -1; -1, 1];

b = [-1000; -2400; -700; -350];

c = [-8; -5];

x0 = [0; 0];
s0 = ones(length(b), 1);
[opt, traceMat] = interiorPointMethodForLinearProgramming(c, A, b, x0, s0);
