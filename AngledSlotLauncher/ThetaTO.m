function [theta0] = ThetaTO(r0,rmax,params,xtar)
%THETATO Summary of this function goes here
%   Detailed explanation goes here
deltaV = integral(@(x)radLegKinematics(x,params.vms,params),r0,rmax) -...
    (rmax - r0);
toVel = sqrt(2*deltaV/params.m)
% toVel = 0.9 * toVel; %Some arbitrary derating 
theta0 = 1/2* asin(xtar * params.g / toVel^2);
end

