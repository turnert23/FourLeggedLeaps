function [CISP] = COMinSP(r,th, params)
%COMINSP Determines whether or not COM is in support polygon
%   Based on half-body-length d, and leg extension r, and leg angle
%   theta, (th) determine where COM is
%   pitch assumed to be locked to zero
com_x_disp = r * sin(th);
if (com_x_disp > params.d || com_x_disp < -params.d)
    CISP = false;
else
    CISP = true;
end

    

end

