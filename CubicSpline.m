function f = CubicSpline(x, y)
  sz = size(x, 2);
  
  % h
  h = zeros(1, sz);
  for i = 2:sz
    h(i) = x(i) - x(i - 1);
  end
  
  % Init values
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
  k = A\r;
  
  % Calculate spline S
  S{1} = @(xx) 0;
  for i = 2:sz % Start from 2 because we need x(i-1)
    
    ai = y(i - 1);
    bi = h(i) * k(i-1);
    ci = 3*(y(i) - y(i - 1)) - h(i)*(2*k(i-1) + k(i));
    di = 2*(y(i - 1) - y(i)) + h(i)*(k(i-1) + k(i));
    
    S{i} = @(xx) ai + bi*((xx - x(i - 1)) / h(i)) + ci*((xx - x(i - 1)) / h(i)).^2 + di*((xx - x(i - 1)) / h(i)).^3;
  end
  f = S;
end