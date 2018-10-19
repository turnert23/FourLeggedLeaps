function [qdot] = eomASL(t,q,params,xdes,thetades)
%EOMASL Equations of motion for the angled slot hopper
%   Angled Slot hopper assumes that as long as the COM remains
%   within the support polygon of the actual system, that 
%   there are no angular forces on the model. 
r = q(1); %r is shank length
th = q(2); %Theta (th) is angle of leg with respect to vertical, where a p
%          positive angle pushes the toe to left in this sagittal view
rdot = q(3);
thdot = q(4);
%For completeness: 
%Cartesian positions
x_com = r*sin(th);
z_com = r*cos(th);
%Cartesian Velocities
xdot_com = rdot * sin(th) + r * thdot * cos(th);
zdot_com = rdot * cos(th) - r * thdot * sin(th);

%Determine controlinputs
[Fr, Fth] = ASLController(t,q,params,xdes,thetades);

%Radial DOF unchanged
rdd = Fr/params.m - params.g * cos(th) + r * thdot ^2;
%Determine whether COM is in support polygon

if(COMinSP(r,th, params))
    thdd = (Fth + params.m * r * (params.g * sin(th) - 2 * rdot * thdot))/ ...
        (params.m * r^2);
else
    thdd = params.m * r * (params.g * sin(th) - 2 * rdot * thdot)/ ...
        (params.m * r^2);
end
qdot = [q(3:4);rdd;thdd];

end

