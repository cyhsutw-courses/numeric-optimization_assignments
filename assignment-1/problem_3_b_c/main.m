function main()
    clear;
    x0 = [9; 1];
    trace_sd = steepest_descent(x0);
    [sd_steps, ~] = size(trace_sd);
    trace_nw = newtons_method(x0);
    [nw_steps, ~] = size(trace_nw);
    
    fprintf('Steepest Descent: %d iterations.\n', sd_steps - 1);
    fprintf('Newton''s Method: %d iterations.\n', nw_steps - 1);
    
    % draw
    hold on;
    % contour
    draw_contour();
    % plot the trace
    p1 = plot(trace_sd(:, 1), trace_sd(:, 2), '-', 'LineWidth', 3, 'Color', [253/255.0, 144/255.0, 72/255.0]);
    p2 = plot(trace_nw(:, 1), trace_nw(:, 2), '-', 'LineWidth', 3, 'Color', [80/255.0, 171/255.0, 42/255.0]);
    legend([p1, p2], {'Steepest Descent', 'Newton''s Method'}, 'Location', 'northwest');
    hold off;
    
end

function draw_contour()
    % draw the contour of the function z = (x*x+9*y*y)/2;
    step = 0.1;
    X = 0:step:9;
    Y = -1:step:1;
    n = size(X,2);
    m = size(Y,2);
    Z = zeros(m,n);
    for i = 1:n
        for j = 1:m
            Z(j,i) = f(X(i),Y(j));
        end
    end
    
    contour(X,Y,Z,100)

    % function definition
    function z = f(x,y)
        z = (x*x+9*y*y)/2;
    end
end