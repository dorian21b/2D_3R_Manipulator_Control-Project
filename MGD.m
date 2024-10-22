function y = MGD(theta1,theta2,theta3)
    
    L1 = 0.3;
    L2 = 0.32;
    L3 = 0.08;
    X = (L1*cosd(theta1)+L2*cosd(theta1+theta2)+L3*cosd(theta1+theta2+theta3));
    Y = (L1*sind(theta1)+L2*sind(theta1+theta2)+L3*sind(theta1+theta2+theta3));

    y = [X;
        Y];
end