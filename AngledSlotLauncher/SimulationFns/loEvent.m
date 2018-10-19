function  [value isterminal direction] = loEvent(t, q, params, xdes,thetades)


eps = .01;
r=q(1);
th=q(2);
rdot = q(3);
thdot = q(4);
xdot_com = rdot * sin(th) + r * thdot * cos(th);
zdot_com = rdot * cos(th) - r * thdot * sin(th);

vdotsq = xdot_com^2 + zdot_com^2; %//rhodot^2;% + (rho * psidot)^2;
theta = atan(xdot_com / zdot_com);

% theta = psi;%psi - beta;
xcur = vdotsq/params.g * sin(2*theta) + sin(th)*r; 
value = [.28-r,(abs(xcur-xdes)-eps)];
% value = (abs(rhodot^2*sin(2*psi)/params.g - xdes))-eps;
isterminal =  [1,1];
direction  = [0,0];
end