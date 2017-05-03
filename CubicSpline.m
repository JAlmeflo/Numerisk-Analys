function f = CubicSpline(x, y)
  sz = size(x)(2);
  
  % Si(x) = ai + bi*ui + ci*ui^2 + di*ui^3;
  
  % ui = (x - x(i-1)) / hi
  
  % ai = y(i-1)
  % bi = hi*k(i-1)
  % ci = 3(yi - y(i-1)) - hi(2k(i-1) + ki)
  % di = 2(y(i-1) - yi) + hi(k(i-1) + ki)
  
  % hi = xi - x(i-1)
  % ki = bi/hi + 2ci/hi + 3di/hi
  
  % Calculate h
  h = zeros(1, sz);
  for i = 2:sz
    h(i) = x(i) - x(i - 1);
  end
  
  % Calculate k
  % Ak = r
  A = zeros(sz);
  k = zeros(sz, 1);
  r = zeros(sz, 1);
  
  % A
  A(1,1) = 2;
  A(1,2) = 1;
  A(sz,sz) = 2;
  A(sz,sz-1) = 1;
  for i = 2:(sz - 1)    
    A(i,i-1) = h(i);
    A(i,i) = 2*(h(i-1) + h(i));
    A(i,i+1) = h(i-1);
  end
  
  % r
  r(1) = 3*((y(2) - y(1)) / h(2));
  r(sz) = 3*((y(sz) - y(sz - 1)) / h(2));
  for i = 2:(sz - 1)
    r(i) = 3*(h(i+1)*((y(i) - y(i-1)) / h(i)) + h(i)*((y(i+1) - y(i)) / h(i+1)));
  end
  
  % k
  % Todo: Calculate k from Ak = r;
  k = A\r;
  
  % Calculate spline S
  %S = zeros(1,sz);
  S{1} = @(x) 0;
  for i = 2:sz % Start from 2 because we need x(i-1)
    % kn_1 + 2kn = rn
    % rn = 3*((yn - yn_1) / hn);
    %ki = 0; % Todo: what is this even?
    %ki_1 = 0; % Todo: and this is what?
    
    ai = y(i - 1);
    bi = h(i) * k(i-1);
    ci = 3*(y(i) - y(i - 1)) - h(i)*(2*k(i-1) + k(i));
    di = 2*(y(i - 1) - y(i)) + h(i)*(k(i-1) + k(i));
    
    % ui = (x - x(i - 1)) / hi;    
    S{i} = @(x) ai + bi*((x - x(i - 1)) / h(i)) + ci*((x - x(i - 1)) / h(i)).^2 + di*((x - x(i - 1)) / h(i)).^3;
  end
  f = S;
end