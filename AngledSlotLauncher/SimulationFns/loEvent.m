function  [value isterminal direction] = loEvent(t, q, params, thdes, rf)

rho=q(1);
psi=q(2);
rhodot = q(3);
psidot = q(4);
value = (rf-rho);
isterminal =  1;
direction  = 0;
end