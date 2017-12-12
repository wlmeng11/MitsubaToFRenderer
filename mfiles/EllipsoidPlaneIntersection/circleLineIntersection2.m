function [alpha1, alpha2, theta1, theta2, noOfSols] = circleLineIntersection2(point1, point2, r, specialCase)

x1 = point1(1);
y1 = point1(2);
x2 = point2(1);
y2 = point2(2);

% dx = x1 - x2;
% dy = y1 - y2;
% a = dx^2 + dy^2;
% b = 2*(dx*x2+dy*y2);
% c = x2^2+y2^2-r^2;
% 
% 
% det = sqrt(b*b-4*a*c);
% 
% alpha1 = (-b+det)/(2*a);
% x=alpha1*x1+(1-alpha1)*x2;
% y=alpha1*y1+(1-alpha1)*y2;
% theta1 = atan2(y, x);
% 
% alpha2 = (-b-det)/(2*a);
% x=alpha2*x1+(1-alpha2)*x2;
% y=alpha2*y1+(1-alpha2)*y2;
% theta2 = atan2(y, x);
noOfSols = 1;
if(specialCase == 1) % Special case -- 1
    dx = x1 - x2;
    dy = y1 - y2;
    a = dx^2 + dy^2;
    b = 2*(dx*x2+dy*y2);
    c = x2^2+y2^2-r^2;

    alpha1 = -b/a;
    alpha2 = 0;
    if(alpha1 >= 0 && alpha1 <= 1)
        noOfSols = noOfSols + 1;
    end
else
    dx = x2 - x1;
    dy = y2 - y1;
    a = dx^2 + dy^2;
    b = 2*(dx*x1+dy*y1);
    c = x1^2+y1^2-r^2;

    alpha1 = 1;
    alpha2 = -b/a;
    if(alpha2 >= 0 && alpha2 <= 1)
        noOfSols = noOfSols + 1;
    end
    alpha2 = 1 - alpha2;
end

x=alpha1*x1+(1-alpha1)*x2;
y=alpha1*y1+(1-alpha1)*y2;
theta1 = atan2(y, x);

x=alpha2*x1+(1-alpha2)*x2;
y=alpha2*y1+(1-alpha2)*y2;
theta2 = atan2(y, x);