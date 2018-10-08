function  [qp] = cart2pola(qc)
x = qc(1);
z = qc(2);
theta = qc(3);
rho = qc(4);
xdot = qc(5);
zdot = qc(6);
rhodot = zdot*cos(theta) - xdot*sin(theta);
psidot = (-zdot*sin(theta) - xdot*cos(theta))/rho;

qp = [rho,theta+pi/2,rhodot,psidot ];

end
