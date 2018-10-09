function [FthActual,FrActual] = UnderheadController(thdes,q,params)
%SATURATIONCOMPUTER Computes actual extension torque
%   Calculates the actual torques from those demanded by enforcing
%   saturation limits on each motor and then pushing those limits through
%   the forward kinematics

% Motor Saturation torque (around 3 Nm per motor)

r = q(1); % Current extension of legs
th = q(2);
L1 = params.l1; % Upper link length
L2 = params.l2; % Lower link length
kp = 40*r^2;
jacobian = [-1 ((1/L1)-((r^2+L1^2-L2^2)/(2*r^2*L1)))/...
            sqrt(1-((r^2+L1^2-L2^2)^2)/(4*r^2*L1^2)) ; 
            -1 -((1/L1)-((r^2+L1^2-L2^2)/(2*r^2*L1)))/...
            sqrt(1-((r^2+L1^2-L2^2)^2)/(4*r^2*L1^2))];


% Calculate demanded torques from the motors
if(thdes > 0)
    motor_tor2 = params.vms;
    motor_tor1 = -params.vms - kp * (thdes - th); 
elseif(thdes<0)
    motor_tor1 = -params.vms;
    motor_tor2 = params.vms - kp *(thdes - th);
else 
    motor_tor1 = -params.vms;
    motor_tor2 = params.vms;
end


% motor_tor1    = motor_tor1*(abs(motor_tor1)<virtual_motor_sat) + sign(motor_tor1)*virtual_motor_sat*(abs(motor_tor1)>=virtual_motor_sat);
% motor_tor2    = motor_tor2*(abs(motor_tor2)<virtual_motor_sat) + sign(motor_tor2)*virtual_motor_sat*(abs(motor_tor2)>=virtual_motor_sat);

% Go back to find final force and torque
res = jacobian'*[-motor_tor1 ; -motor_tor2];
FthActual = res(1)
FrActual   = res(2)

end

