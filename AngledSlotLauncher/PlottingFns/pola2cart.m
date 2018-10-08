function  [qc] = pola2cart(qp,xtd)
qc = [];
for k=1:length(qp)
    r = qp(k,1);
    th = qp(k,2);
    rdot = qp(k,3);
    thdot = qp(k,4);
    x = r*sin(th);
    z = r*cos(th);
    xdot = rdot * sin(th) + r * thdot * cos(th);
    zdot = rdot * cos(th) - r * thdot * sin(th);
    qcr = [x, z, th,r,xdot,zdot,0,0];
    qc = [qc;qcr];
    

end
