function f = v_prim(t1, h)
  a1 = 1.5;
  a2 = 1.5;
  a3 = 8;
  vt = @(t) [4*t*cos(t) + a1, 2*t*sin(2*t - a2), a3 - t.^2];
  prim = (vt(t1 + h) - vt(t1 - h)) / (2*h);
  f = prim;
end