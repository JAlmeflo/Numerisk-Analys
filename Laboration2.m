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

vt = @(t) [4*t.*cos(t) + a1, 2*t.*sin(2*t - a2), a3 - t.^2];
fxy = @(x, y) (a4*x.^2 + a5*y.^2 + x*y - 10*a6) / (10*a7);

%r = -2*pi:0.01:2*pi; % Old range value
r = linspace(-2.8383, 2.8444, 100); % New range value (med 100 punkter)
%plot3(4.*r.*cos(r) + a1, 2.*r.*sin(2.*r - a2), a3 - r.^2, '*');
hold on; % Also write the mesh to the same graph

%y = [(a4.*x.^2 + a5.*y.^2 + x.*y + 10.*a6) / (10.*a7)]
%area(r, y)

[rx, ry] = meshgrid(-15:0.1:15, -15:0.1:15);
rz = (a4*rx.^2 + a5*ry.^2 + rx.*ry - 10*a6) / (10*a7);
surf(rx, ry, rz);
hold off;

skar = @(t) (2*t*sin(2*t - 1.5)).^2 + (4*t*cos(t)+1.5)*(2*t*sin(2*t - 1.5)) + 105*t.^2 - 920;

f = HalveringMetod(0.001);
disp(f);

st = zeros(1,100);
for i = 2:100
  st(i) = baglangd(i,r);
end

plot(r, st); % Will plot task 12


% 13
Q = CubicSpline(st, r);
for i = 2:100
  %fplot(Q{i}, [st(i-1) st(i)]);
  hold on;
end
hold off;
%legend("hide"); % Octave specific

%14
sigmaTot = linspace(st(1), st(100), 100);
for i = 1:100
  tmp = vt(Q{i}(sigmaTot(i)));
end
sigmaTot = sigmaTot';
S = spline(st, r);
W = vt(ppval(S,sigmaTot));
scatter3(W(:,1),W(:,2),W(:,3));


%15
%a
aby = vt(2.8444);
h = 10.^(-5);
fpx = (fxy(aby(1) + h, aby(2)) - fxy(aby(1) - h, aby(2))) / (2*h);
fpy = (fxy(aby(1), aby(2) + h) - fxy(aby(1), aby(2) - h)) / (2*h);

%b
u = [1, 0, fpx];
v = [0, 1, fpy];
tmp = vt(2.8444);
z = tmp(3);

x0 = tmp(1);
y0 = tmp(2);
z0 = tmp(3);
%a1 = 1;
%a2 = 0;
b1 = 0;
b2 = 1;
y1 = fpx;
y2 = fpy;

% =>
%x = x0 + s;
%y = y0 + t;
%z = z0 + y1*s + y2*t;

% =>
%s = x - x0;
%t = y - y0;

% =>
%z = z0 + y1*(x - x0) + y2*(y - y0);
%z = z0 + y1*x - y1*x0 + y2*y - y2*y0;
%y1*x + y2*y - z + (z0 - y1*x0 - y2*y0) = 0;
a = y1;
b = y2;
c = -1;
d = z0 - y1*x0 - y2*y0;

% c
A = [ 1 0 0
      0 1 0
      0 0 -1];
% d
vbp = v_prim(2.8444, 10.^-5);
Svar = vbp * A;