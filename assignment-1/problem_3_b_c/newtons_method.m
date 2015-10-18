function trace = newtons_method(x0)
    x = x0;

    H = [
        [1, 0];
        [0, 9]
    ];
    trace = [x0];    
    while true
        g = x .* [1; 9];
        delta = -H \ g;
        if norm(delta) < 10^-4
            break;
        end
        x = x + delta;
        trace = [trace x];
    end
    trace = trace';
end