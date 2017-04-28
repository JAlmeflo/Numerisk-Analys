function f = HalveringMetod(e)
   % skar = @(t) (2*t*sin(2*t - 1.5))*((2*t*sin(2*t - 1.5)) + (4*t*cos(t)+1.5)) + 105*t.^2 - 920;
    skar = @(t) (2*t*sin(2*t - 1.5)).^2 + (4*t*cos(t)+1.5) * (2*t*sin(2*t - 1.5)) + 105*t.^2 - 920;
    a = -2*pi;
    b = 0;
    if(skar(a) * skar(b) > 0)
        disp('Bajs');
    end
    
    ap = a;
    bp = b;
    
    for i=0:5
        if(abs(ap - bp) < e)
            
            break;
        end
        m = ((ap + bp)/2);
        if(sign(skar(ap)*skar(m)) < 0)
            bp = m;
        elseif(sign(skar(bp)*skar(m)) < 0)
            ap = m;
        else
            ap = m;
            bp = m;
            break;
        end
    end
    f = [ap,bp];
end