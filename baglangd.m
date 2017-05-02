function f = baglangd(t)
    startf  = v(-2.8383);
    endf    = v(t);
    sum = 0;
    for i = 1:99
       sum = sum + SimpsonsRule(i, i+1); 
    end
    
    f = sum;
end