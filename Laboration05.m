%size = 8;
s = 0;
function f = GenerateAn(s)
  %t1 = time();
  A = ones(s,s);
  for n = 1:s
    if mod(n,2) == 0
      A(n,n) = 0;
    end
  end

  for i = 1:s
    for j = 1:s
      if i == j
        continue;
      end
      m = max(i,j);
      %value = 1;
      if A(m,m) == 0
        %value = 2;
        A(i,j) = 2;
      end
      %A(i,j) = value;
    end
  end
  %t2 = time();
  f = A;
  %f = [t1, t2];
end

