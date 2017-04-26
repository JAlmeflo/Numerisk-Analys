% (a) Bestäm grafiskt ett slutet intervall för p(x)
p = @(x) x.^5 - x.^3 + 12*(x.^2) + 36*x - 2;
fplot(p, [0.15 2.55 0 255]); % Ritar ut grafen i intervallet: x: 0.15:2.55, y: 0:255
legend("hide");
x0 = 1.35; %Mittpunkten av vårt intervall


% (c) Implementera funktionen kryptera(t) som retunerar ett värde
% x sådant att p(x) = t
function f = kryptera(t)
  % Funktionen p, med dess derivata pdiff
  p = @(x) x.^5 - x.^3 + 12*(x.^2) + 36*x - 2;
  pdiff = @(x) 5*x.^4 - 3*x.^2 + 24*x + 36;
  % Mittpunkten x0
  x0 = 1.35;
  
  % Newtons metod för att räkna ut x
  % Sluta när |xn - xn_1| <= 10^(-15)
  xn = x0 + ((t - (p(x0)) / pdiff(x0)));
  stop = abs(xn -x0);
  while (stop > 10.^-15)
    xn_1 = xn;
    xn = xn_1 + ((t - p(xn_1)) / pdiff(xn_1));
    stop = abs(xn - xn_1);
  endwhile
  f = xn;
end

% (d) Avkoda det dolda meddelandet
num = hex2num("3ff5801d2444f174");
d = p(num);
str = char(d);
num = hex2num("3ffae1a989917c2b");
d = p(num);
str = strcat(str, char(d));
num = hex2num("3ffbe37203e3eaa5");
d = p(num);
str = strcat(str, char(d));
str = ['(d) Det dolda meddelandet var: ', str];
disp(str);
disp(''); % Empty row


% (e) Kryptera meddelandet: Hello World!
message = "Hello World!";
str2 = "";
% För varje tecken, gör om det till ascii och sedan kryptera tecknet
for n = 1:size(message, 2);
  ascii = toascii(message(n));
  encrypted = kryptera(ascii);
  str2 = [str2, num2hex(encrypted), ' '];
end
str2 = ['(e) Det krypterade meddelandet blir: ', str2];
disp(str2);
disp(''); % Empty row



% (f) Undersök om samtliga element i A efter kryptering
% dekrypteras tillbaka till samma element
disp('(f) Element som inte matchar: ');
for i = 0:255
  i2 = round((p(kryptera(i))));
  if i != i2 
    disp(i); % Skriver ut det element som inte stämmer
  end
end
disp(''); % Empty row


% (g) Avkoda bilden
img = imread('bild-g.bmp');
imgText = "";
totalSize = size(img, 1) * size(img, 2);
rowsize = size(img, 1);
% Läs 8 tecken i taget, upp till storleken av matrisen
for i = 1:8:totalSize
  dec = [];
  for j = 0:7
    tmpValue = 0;
    % Se till så att vi inte får outofbounds
    if i + j < totalSize
      % Räkna ut vilken rad och kolumn vi är på och hämta det värdet
      k = i + j - 1;
      column = floor((k / rowsize) + 1);
      row = mod(k,rowsize) + 1;
      tmpValue = img(column, row);
    end
    dec = [dec tmpValue];
  end
  % Gör om de 8 decimala tecknen till hexadecimala 
  % och skriv sedan dem till en sträng, tmpText
  tmpText = '';
  hex = dec2hex(dec);
  for j = 1:size(hex,1)
    for k = 1:size(hex,2)
      tmpText = [tmpText hex(j,k)];
    end
  end
  % Avkoda vad för tecken det är och lägg sedan till det till strängen imgText
  num = p(hex2num(tmpText));
  imgText = [imgText char(num)];
  
end
disp('(g) Bilden avkrypteras till: ');
disp(imgText);