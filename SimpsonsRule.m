function f = SimpsonsRule(a, b)
  n = 25;
  h = (b - a) / (2*n);
  h_prim = 10^(-8);
  
  sum = 0;
  
  for k = 1:n
    k1 = 2*k - 2;
    k2 = 2*k - 1;
    k3 = 2*k;
    
    x1 = a + k1*h;
    x2 = a + k2*h;
    x3 = a + k3*h;
    
    f1 = abs(norm(v_prim(x1, h_prim)));
    f2 = abs(norm(v_prim(x2, h_prim)));
    f3 = abs(norm(v_prim(x3, h_prim)));
    
    sum = sum + (f1 + 4*f2 + f3);    
  end
  sum = (h / 3) * sum;
  f = sum;
end