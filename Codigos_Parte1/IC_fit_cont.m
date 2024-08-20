@ function[c] = IC_basic_cont()

px = @(t) t;
dpx = @(t) 1;
ddpx = @(t) 0;

py = @(t) t^3;
dpy = @(t) 3*t^2;
ddpy = @(t) 6*t;

t0 = 1.5;
t1 = 4.5;

x0 = px(t0);
y0 = py(t0);

x3 = px(t1);
y3 = py(t1);

#Dá para otimizar
Kp0 = (dpx(t0) * ddpy(t0) - dpy(t0) * ddpx(t0)) / (dpx(t0)^2 + dpy(t0)^2)^(1.5);
Kp1 = (dpx(t1) * ddpy(t1) - dpy(t1) * ddpx(t1)) / (dpx(t1)^2 + dpy(t1)^2)^(1.5);

norm_pt0 = (dpx(t0)^2 + dpy(t0)^2)^0.5;
norm_pt1 = (dpx(t1)^2 + dpy(t1)^2)^0.5;

C01 = dpx(t0)/norm_pt0;
S01 = dpy(t0)/norm_pt0;
C02 = -dpx(t1)/norm_pt1;
S02 = -dpy(t1)/norm_pt1;

#Dá para otimizar
a1 = 2/3 * 1/Kp0 * (C01*(y3 - y0) - S01*(x3 - x0));
a2 = 2/3 * 1/Kp1 * (C02*(y3 - y0) - S02*(x3 - x0));
b1 = 2/3 * 1/Kp0 * (C01*S02 - S01*C01);
b2 = 2/3 * 1/Kp1 * (C01*S02 - S01*C01);

p = -2*a1;
q = -b2 * b1^2;
r = a1^2 - a2*b1^2;

coeff = [1, 0, p, q, r];

r1_val = roots(coeff)

for k = 1:4
    if isreal(r1_val(k)) == true && r1_val(k)>0
        r1 = r1_val(k);
    end
end

r2 = (r1^2 - a1)/b1;

x1 = x0 + r1*C01;
y1 = y0 + r1*S01;

x2 = x3 + r2*C02;
y2 = y3 + r2*S02;

P0 = [x0, y0];
P1 = [x1, y1];
P2 = [x2, y2];
P3 = [x3, y3];

p_plot(px, py, t0, t1, 100)
hold on
b_plot(P0, P1, P2, P3, 100)
hold off
grid on


endfunction
