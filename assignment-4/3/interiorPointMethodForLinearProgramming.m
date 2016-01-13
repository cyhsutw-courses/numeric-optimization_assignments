function [opt, traceMat] = interiorPointMethodForLinearProgramming(c, A, b, x0, s0)
  [m, n] = size(A);

  x = x0;
  opt = x;
  s = s0;
  lambda = ones(length(s), 1);

  % tolerance
  tolerance = 10^-3;

  % initialize sigma
  rng('shuffle');
  sigma = rand(1);

  % init e
  e = ones(m, 1);

  traceMat = [x];

  while 1
    lambdaMat = diag(lambda);
    sMat = diag(s);
    mu = lambda' * s / m;

    mat = [
      zeros(n, n)   -A'           zeros(n, m);
      -A            zeros(m, m)   eye(m);
      zeros(m, n)   sMat          lambdaMat
    ];

    resultVec = [
      A' * lambda - c;
      A * x - s - b;
      sigma * mu * e - lambdaMat * sMat * e
    ];

    deltaVec = mat \ resultVec;

    [newX, newS, newLambda] = fitAlpha(x, s, lambda, deltaVec, mu);

    shouldBreak = norm(newX - x, 2) < tolerance;

    x = newX;
    s = newS;
    lambda = newLambda;
    opt = x;

    traceMat = [traceMat, x];

    if ( shouldBreak )
      break
    end
  end

end

function [newX, newS, newLambda] = fitAlpha(x, s, lambda, deltaVec, mu)
  xLength = length(x);
  lambdaLength = length(lambda);
  sLength = length(lambda);

  totalLength = length(deltaVec);

  deltaX = deltaVec(1 : xLength);
  deltaLambda = deltaVec(xLength + 1 : xLength + lambdaLength);
  deltaS = deltaVec(totalLength - sLength + 1 : totalLength);

  % init alpha = 1.0 (full delta)
  alpha = 1.0;
  decreaseRate = 0.9;

  tolerance = 10^-3;

  while 1
    newX = x + alpha * deltaX;
    newLambda = lambda + alpha * deltaLambda;
    newS = s + alpha * deltaS;

    if ( ~all( newLambda .* newS >= tolerance * mu ) )
      break
    else
      alpha = alpha * decreaseRate;
    end
  end
end
