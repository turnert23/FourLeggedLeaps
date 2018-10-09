function [Fr, Fth] = ASLController(t,q,params, thdes,rf)
%ASLCONTROLLER Feedback controller for ASL
%   Based on current state and intrinsic params, 
%   determine Fr and Fth as inputs to the system
r = q(1);
th = q(2);
rdot = q(3);
thdot = q(4);

%Find max tau available after stablilizing angle
%tau = 6; % For now

%Fr = 4 * radLegKinematics(r,tau, params);  
Fr = 200; %PWM Saturated Control

%Determine if thdes should be updated
thdes = thdes +0;

%kp and kd can be tuned later? 
kp = 250; 
kd = 0.01;
%Fth is some PD servo on desired angle
% Fth = kp * (thdes - th) - kd * thdot;
Fth = -(params.m * r*(params.g *sin(th) -2*rdot*thdot))
% [Fth, Fr] = SaturationComputer(Fth,Fr,q,params);

end

