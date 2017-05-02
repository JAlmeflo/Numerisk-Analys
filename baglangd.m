function f = baglangd(i)
    sum = 0;
    for k = 1:(i-1)
       sum = sum + SimpsonsRule(k, k+1);
    end
    f = sum;
end