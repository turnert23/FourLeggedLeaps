function [] = ASLSim(q0, rf, showSim)
%ASLSIM Simulates an angled slot launcher
%  


addpath(genpath('PlottingFns'))
addpath(genpath('EOMs'))
addpath(genpath('SimulationFns'))

params = struct;
params.m = 5; %kg 
params.g = 9.8; %m/s^2
params.d = .2; % half body length in meters
params.l1 = .1; % Upper link length
params.l2 = .2; % Lower link length

r0 = q0(1);

%

% Use expected energy to pick a thdes, and th0
%
thdes = .2;
q0(2) = thdes; 

%initial velocities are zero 
q0(3) = 0;
q0(4) = 0;

%Predict leap apex
[pax, paz, paxd] = apexPred(r0,rf,thdes,params);
pa = [pax, paz, paxd];
%This tsg thing is some vestige of an iterative thing, 
% should start at 0
tsg = 0; % in seconds

%tend is also dumb, just needs to be bigger than the actual time in stance
tend = 3; % in seconds

Tg = [];
Qg = [];
% while tg<tend
    tspan = [tsg,tend];
    abstol=1e-4; 
    reltol=1e-3; 
    maxstep=1e-3;
    %ICs
    options=odeset('events',@loEvent,'RelTol',reltol,'MaxStep',maxstep,'AbsTol',abstol);
    [T,Q]=ode23s(@eomASL, tspan, q0, options,params, thdes, rf);
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
    [T,Q]=ode23s(@eomFlight,tspan,q0,options,params);
    Tg = vertcat(Tg,T);
    Qg = vertcat(Qg,Q);
    tsg = T(end);
 
    
    xdf = Qg(end,5);

if(showSim)
    plotASLSim(Tg,Qg,params,pa);
end

