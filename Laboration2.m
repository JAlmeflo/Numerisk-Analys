% 20 december - Johan (921220)
% 28 juni - Viktor (920628)

p1 = (1 + 0) / 2;
p2 = (2 + 6) / 2;
p3 = (2 + 2) / 2;
p4 = (0 + 8) / 2;

a1 = p3 - p1;
a2 = p1 + 1;
a3 = p3 + 6;
a4 = 4 - p4;
a5 = 5 - p4;
a6 = p2 + p4;
a7 = p1 + p2 + p3 + p4;

% v(t) = (4*t*cos(t) + a1, 2*t*sin(2*t - a2), a3 - t.^2);
% f(x, y) = (a4*x.^2 + a5*y.^2 + x*y + 10*a6) / (10*a7);

vt = @(t) [4*t*cos(t) + a1, 2*t*sin(2*t - a2), a3 - t.^2];
fxy = @(x, y) (a4*x.^2 + a5*y.^2 + x*y - 10*a6) / (10*a7);

%r = -2*pi:0.01:2*pi; % Old range value
r = linspace(-2.8383, 2.8444, 100); % New range value (med 100 punkter)
plot3(4.*r.*cos(r) + a1, 2.*r.*sin(2.*r - a2), a3 - r.^2, '*');
hold on; % Also write the mesh to the same graph

%y = [(a4.*x.^2 + a5.*y.^2 + x.*y + 10.*a6) / (10.*a7)]
%area(r, y)

[rx, ry] = meshgrid(-15:0.1:15, -15:0.1:15);
rz = (a4*rx.^2 + a5*ry.^2 + rx.*ry - 10*a6) / (10*a7);
surf(rx, ry, rz);
hold off;

%skar = @(t) (2*t*sin(2*t - 1.5))*((2*t*sin(2*t - 1.5)) + (4*t*cos(t)+1.5)) + 105*t.^2 - 920;
skar = @(t) (2*t*sin(2*t - 1.5)).^2 + (4*t*cos(t)+1.5)*(2*t*sin(2*t - 1.5)) + 105*t.^2 - 920;

f = HalveringMetod(0.001);
disp(f);

st = zeros(1,100);
for i =1:100
  st(i) = baglangd(i,r);
end

plot(r, st); % Will plot task 12
