function trace = steepest_descent(x0)
    x = x0;
    H = [
        [1, 0];
        [0, 9]
    ];
   trace = [x0];
   while true
        g = x .* [1; 9];
        eta = (g'*g) / (g'*H*g);
        d = -g;
        if norm(eta * d) < 10^-4
            break;
        end
        x = x + eta * d;
        trace = [trace x];
   end 
   trace = trace';
end