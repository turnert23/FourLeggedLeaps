function [FthActual,FrActual] = SaturationComputer(FthDes,FrDes,q,params)
%SATURATIONCOMPUTER Computes actual extension torque
%   Calculates the actual torques from those demanded by enforcing
%   saturation limits on each motor and then pushing those limits through
%   the forward kinematics

% Motor Saturation torque (around 3 Nm per motor)
virtual_motor_sat = params.vms;
r = q(1); % Current extension of legs
L1 = params.l1; % Upper link length
L2 = params.l2; % Lower link length

jacobian = [-1 ((1/L1)-((r^2+L1^2-L2^2)/(2*r^2*L1)))/...
            sqrt(1-((r^2+L1^2-L2^2)^2)/(4*r^2*L1^2)) ; 
            -1 -((1/L1)-((r^2+L1^2-L2^2)/(2*r^2*L1)))/...
            sqrt(1-((r^2+L1^2-L2^2)^2)/(4*r^2*L1^2))];


% Calculate demanded torques from the motors
motor_torques = -inv(jacobian')*[FthDes; FrDes];
motor_tor1    = motor_torques(1);
motor_tor2    = motor_torques(2);
motor_tor1    = motor_tor1*(abs(motor_tor1)<virtual_motor_sat) + sign(motor_tor1)*virtual_motor_sat*(abs(motor_tor1)>=virtual_motor_sat);
motor_tor2    = motor_tor2*(abs(motor_tor2)<virtual_motor_sat) + sign(motor_tor2)*virtual_motor_sat*(abs(motor_tor2)>=virtual_motor_sat);

% Go back to find final force and torque
res = jacobian'*[-motor_tor1 ; -motor_tor2];
FthActual = res(1);
FrActual   = res(2);

end

