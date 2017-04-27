function f = SekantMetod(xn, xn_1)
  skar = @(t) (2*t*sin(2*t - 1.5))*((2*t*sin(2*t - 1.5)) + (4*t*cos(t)+1.5)) + 105*t.^2 - 920;
  
  e = 10^(-10);
  %xn = -2.74;
  %xn_1 = -2.94;
  
  while (abs(xn - xn_1) > e)
    xn1 = xn - skar(xn)*((xn - xn_1)/(skar(xn) - skar(xn_1)));
    
    xn_1 = xn;
    xn = xn1;
  end
  f = xn;
end
