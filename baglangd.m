function f = baglangd(t)
    sum = 0;
    for i = 1:99
       sum = sum + SimpsonsRule(i, i+1); 
    end
    
    f = sum;
end