function [F] = radLegKinematics(r,tau, params)
%RADLEGKINEMATICS Computes effective gearing from leg extension
%   Assumes that leg velocity is negligible, where r is leg extension
%   l1 is upper link length and l2 is lower link length
l1 = params.l1;
l2 = params.l2;

F = tau * (r.^2 - l1^2 + l2^2)./...
    (r.^2 .* l1 .* sqrt(-(l1^4 +(l2^2 - r.^2).^2 - 2 * l1^2 * (l2^2 + r.^2))...
    ./(l1^2 * r.^2)));

end

