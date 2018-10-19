function [Fr, Fth] = ASLController(t,q,params, xdes, thetades)
%ASLCONTROLLER Feedback controller for ASL
%   Based on current state and intrinsic params, 
%   determine Fr and Fth as inputs to the system
r = q(1);
th = q(2);
rdot = q(3);
thdot = q(4);
% [Fth, Fr] = UnderheadController(thdes,q,params);
%Find max tau available after stablilizing angle
%tau = 6; % For now

%Fr = 4 * radLegKinematics(r,tau, params);  
Fr = 300;% - rand()*50; %PWM Saturated Control
eta = rdot^2;
psi = csc(2*th); 

%Determine if thdes should be updated
% thdes = thdes +0;
vdotsq = rdot^2 + (r * thdot)^2;
thdes = 1/2* asin(xdes * params.g / vdotsq);
if thdes < 0.7 && thdes > 0 && imag(thdes)==0
    thdes;
else
    thdes = thetades;
end
%kp and kd can be tuned later? 
kp = 200; 
kd = 0.01;
%Fth is some PD servo on desired angle
% Fth = kp * (thdes - th) - kd * thdot + -(params.m * r*(params.g *sin(th) -2*rdot*thdot));
Fth = 0;
Fth = -(params.m * r*(params.g *sin(th) - 2*rdot*thdot)) + kp * (thdes - th) - kd * thdot;
[Fth, Fr] = SaturationComputer(Fth,Fr,q,params);

end

