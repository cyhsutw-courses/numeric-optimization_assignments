function normTrace = generateGradientNormTrace(aTrace)
  normTrace = [];
  for i = 1 : length(aTrace)
    aNorm = norm(aTrace(i, :));
    if aNorm < 10^-15
      aNorm = min(normTrace);
    end
    normTrace = [normTrace aNorm];
  end
end
