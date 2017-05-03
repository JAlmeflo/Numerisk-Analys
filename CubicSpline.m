function f = CubicSpline(x, y)
  % Si(x) = ai + bi*ui + ci*ui^2 + di*ui^3;
  
  % ui = (x - x(i-1)) / hi
  
  % ai = y(i-1)
  % bi = hi*k(i-1)
  % ci = 3(yi - y(i-1)) - hi(2k(i-1) + ki)
  % di = 2(y(i-1) - yi) + hi(k(i-1) + ki)
  
  % hi = xi - x(i-1)
  % ki = bi/hi + 2ci/hi + 3di/hi
  
  sz = size(x)(2);
  S = zeros(1,sz);
  for i = 2:sz % Start from 2 because we need x(i-1)
    hi = x(i) - x(i - 1);
    
    ki = 0; % Todo: what is this even?
    ki_1 = 0; % Todo: and this is what?
    
    ai = y(i - 1);
    bi = hi * ki_1;
    ci = 3*(y(i) - y(i - 1)) - hi*(2*ki_1 + ki);
    di = 2*(y(i - 1) - yi) + hi*(ki_1 + ki);
    
    % ui = (x - x(i - 1)) / hi;    
    S(i) = @(x) ai + bi*((x - x(i - 1)) / hi) + ci*((x - x(i - 1)) / hi).^2 + di*((x - x(i - 1)) / hi).^3;
    
    
  end
  
end