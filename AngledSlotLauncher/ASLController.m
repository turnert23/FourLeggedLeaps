function [Fr, Fth] = ASLController(t,q,m,g,thdes,rf)
%ASLCONTROLLER Feedback controller for ASL
%   Based on current state and intrinsic params, 
%   determine Fr and Fth as inputs to the system
r = q(1);
th = q(2);
rdot = q(3);
thdot = q(4);

%Find max tau available after stablilizing angle
tau = 5; % For now

Fr = 4 * radLegKinematics(r,.1,.2,tau);  

%Determine if thdes should be updated
thdes = thdes +0;

%kp and kd can be tuned later? 
kp = 5; 
kd = 0.1;
%Fth is some PD servo on desired angle
Fth = kp * (thdes - th) - kd * thdot;
end

