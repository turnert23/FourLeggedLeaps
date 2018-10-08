function [xA, zA, xdA] = apexPred(r0,rf,thdes,params)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Use r0, rf to determine expected energy
%Conservative expection of final added kinetic energy.
deltaV = integral(@(x)radLegKinematics(x,5,params),r0,rf) -...
    (rf*cos(thdes) - r0*cos(thdes));
toVel = sqrt(2*deltaV/params.m);
toAngle = pi/2-thdes;
zA = toVel^2 * sin(toAngle)^2/(2*params.g) + sin(toAngle)*rf;
xdA = cos(toAngle)*toVel;
xA =  xdA * (sqrt(2)/2) * (toVel/params.g) + cos(toAngle)*rf;

end

