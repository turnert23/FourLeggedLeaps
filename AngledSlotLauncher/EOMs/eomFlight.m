function [qdot] = eomFlight(t,q,m,g)
    x=q(1);
    z=q(2);
    theta = q(3);
    r = q(4);
    xdot =q(5);
    zdot = q(6);
    thetadot = q(7);
    rdot = q(8);
    qdot = [q(5:8);0;-g;0;0];
end