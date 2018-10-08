function Rect2( x1, y1, x2, y2, offset1, offset2 )

% Inputs: coords of 2 points (x1,y1), (x2,y2), and 2 offset values
% Output: creates a rectangle from the line that connects them

% % Input values for testing the function
% x1 = 0;
% y1 = 0;
% x2 = 1;
% y2 = 1;
% offset1 = 0.2;
% offset2 = 0.1; 

% Find tha angle of the line that connects the 2 points
th = atan((y2-y1)/(x2-x1));

% Find a point that will be the center of the rectangle
x = (x1 + x2)/2;
y = (y1 + y2)/2;

% Rotation matrix for theta
R=[cos(th) sin(th); sin(th) -cos(th)];   

% Dimensions of the rectangle
d1 = norm([x2-x1 y2-y1]) + 2 * offset1;
d2 = 2 * offset2;

% Rectangle corners v1vectors
v1 = [-d1/2 , d2/2];  % up left corner
v2 = [d1/2 , d2/2];   % up right corner
v3 = [d1/2 , -d2/2];  % down right corner
v4 = [-d1/2 , -d2/2]; % down left corner

% Corners in global system
v1gl = [x , y] + v1 * R; 
v2gl = [x , y] + v2 * R;
v3gl = [x , y] + v3 * R;
v4gl = [x , y] + v4 * R;

% Plot Rectangle
abcissas = [v1gl(1) v2gl(1) v3gl(1) v4gl(1)]; 
ordinates = [v1gl(2) v2gl(2) v3gl(2) v4gl(2)];
fill(abcissas, ordinates, [0.96, 0.96, 0.96]);

end

