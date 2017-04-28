function f = SimpsonsRule(a, b)
  n = 25;
  h = (b - a) / (2*n);
  h_prim = 10^(-8);
  
  sum = 0;
  
  for k = 1:n      
    f1 = norm(v_prim(2*k - 2, h_prim));
    f2 = norm(v_prim(2*k - 1, h_prim));
    f3 = norm(v_prim(2*k, h_prim));
    sum = sum + (f1 + 4*f2 + f3);    
  end
  sum = (h / 3) * sum;
  f = sum;
end