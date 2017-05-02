function f = baglangd(i, r)
    sum = 0;
    for k = 1:(i-1)
       sum = sum + SimpsonsRule(r(k), r(k+1));
    end
    f = sum;
end