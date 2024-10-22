function y = cine_inverse(u)
    L1 = 0.3;
    L2 = 0.32;
    L3 = 0.08;
    
    Wx = u(1)-L3*cos(u(3));
    Wy = u(2)-L3*sin(u(3));
    d = sqrt(Wx^2+Wy^2);
    
    theta2 = -acos((d^2-L1^2-L2^2)/(2*L1*L2));
    theta1 = atan2(Wy,Wx) + acos((d^2+L1^2-L2^2)/(2*d*L1));
    theta3 = u(3) - theta2 - theta1;
    
    y=[theta1;theta2;theta3];
end