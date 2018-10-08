function [alpha] = hopperSim(tdot,rs,showSim)
%HOPPERSIM Simulates a SLIP hopper 
%  

m = 5; %kg 
g = 9.8; %m/s^2
xd0 = (rand()+1);
z0 = (rand()-.5)/5+.4;
rho = .2;

zdf = -g*sqrt(2/g*(z0-rho));

th0 = ((-(1/sqrt(2/(g*rho^3)))) - zdf*rho^3 +...
    sqrt((4*xd0^2*rho^3)/g + (1 + zdf*sqrt(2/(g*rho^3))*rho^3)^2)/...
    (sqrt(2)*sqrt(1/(g*rho^3))))/(xd0*rho^3)/2;
tho = atan(xd0/-zdf);
vm = sqrt(xd0^2+zdf^2);
k1 = tho*vm/rho;
th0 = (g*rho+tho*vm^2 - sqrt(g*rho*(g*rho + 2*tho*vm^2)))/(vm^2)+.16;
q0 = [0,z0,th0,rho,xd0,0,0,0];
%rs = .4;
ab = true;
tsg = 0; 
tend = 3;
Tg = [];
Qg = [];
% while tg<tend
    tspan = [tsg,tend];
    abstol=1e-4; 
    reltol=1e-3; 
    maxstep=1e-3;
    %ICs
    q0 = [.12, 2*pi/3,0,tdot ];
    options=odeset('events',@loEvent,'RelTol',reltol,'MaxStep',maxstep,'AbsTol',abstol);
    [T,Q]=ode23s(@eomSLIP,tspan,q0,options,m,g,rs);
    Qc= pola2cart(Q,0);
    alpha = Qc(end,5)/Qc(end,6);
    Tg = vertcat(Tg,T);
    Qg = vertcat(Qg,Qc);
    q0 = Qg(end,:);
    q0(3) = 0;
    q0(4) = .15;
    q0(7) = 0;
    q0(8) = 0;
    options=odeset('events',@apexEvent,'RelTol',reltol,'MaxStep',maxstep,'AbsTol',abstol);
    [T,Q]=ode23s(@eomFlight,tspan,q0,options,m,g);
    Tg = vertcat(Tg,T);
    Qg = vertcat(Qg,Q);
    tsg = T(end);
 
    
    xdf = Qg(end,5);
%     if ab 
%         options=odeset('events',@tdEvent,'RelTol',reltol,'MaxStep',maxstep,'AbsTol',abstol);
%         [T,Y]=ode23s(@eomFlight,tspan,q0,options,m,g);
%         ab = false;
%     else
%         ab = true;
%     end
%    horzcat(Tg,T);
   
% end
if(showSim)
    plotHopSim(Tg,Qg);
end

