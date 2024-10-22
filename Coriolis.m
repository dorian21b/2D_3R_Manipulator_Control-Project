function C = Coriolis(q,qp)
    m1 = 1;
    m2 = 1;
    m3 = 0.5;
    L1 = 0.3;
    L2 = 0.32;
    L3 = 0.08;
    l1 = L1/2;
    l2 = L2/2;
    l3 = L3/2;
    
    
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    qdot1 = qp(1);
    qdot2 = qp(2);
    qdot3 = qp(3);


        
    Gamma112 = L1*m3*cos(q2 + q3)*(L1*sin(q2 + q3) + L2*sin(q3)) + L1^2*m2*cos(q2)*sin(q2) - L1*m2*sin(q2)*(l2 + L1*cos(q2)) - L1*m3*sin(q2 + q3)*(l3 + L1*cos(q2 + q3) + L2*sin(q3));
    Gamma113 = m3*(L1*cos(q2 + q3) + L2*cos(q3))*(L1*sin(q2 + q3) + L2*sin(q3)) - m3*(L1*sin(q2 + q3) - L2*cos(q3))*(l3 + L1*cos(q2 + q3) + L2*sin(q3));
    Gamma122 = L1*L2*m3*cos(q2 + q3)*sin(q3) - L1*l2*m2*sin(q2) - L1*m3*sin(q2 + q3)*(l3 + L2*cos(q3));
    Gamma123 = (L2*m3*sin(q3)*(L1*cos(q2 + q3) + L2*cos(q3)))/2 - (m3*(L1*sin(q2 + q3) - L2*cos(q3))*(l3 + L2*cos(q3)))/2 - (L1*l3*m3*sin(q2 + q3))/2 + (L2*m3*cos(q3)*(L1*sin(q2 + q3) + L2*sin(q3)))/2 - (L2*m3*sin(q3)*(l3 + L1*cos(q2 + q3) + L2*sin(q3)))/2;
    Gamma133 = -l3*m3*(L1*sin(q2 + q3) - L2*cos(q3));
    Gamma211 = L1*m2*sin(q2)*(l2 + L1*cos(q2)) - L1^2*m2*cos(q2)*sin(q2) - L1*m3*cos(q2 + q3)*(L1*sin(q2 + q3) + L2*sin(q3)) + L1*m3*sin(q2 + q3)*(l3 + L1*cos(q2 + q3) + L2*sin(q3));
    Gamma212 = 0;
    Gamma213 = (L2*m3*sin(q3)*(L1*cos(q2 + q3) + L2*cos(q3)))/2 - (m3*(L1*sin(q2 + q3) - L2*cos(q3))*(l3 + L2*cos(q3)))/2 + (L1*l3*m3*sin(q2 + q3))/2 + (L2*m3*cos(q3)*(L1*sin(q2 + q3) + L2*sin(q3)))/2 - (L2*m3*sin(q3)*(l3 + L1*cos(q2 + q3) + L2*sin(q3)))/2;
    Gamma223 = L2^2*m3*cos(q3)*sin(q3) - L2*m3*sin(q3)*(l3 + L2*cos(q3));
    Gamma233 = -L2*l3*m3*sin(q3);
    Gamma311 = m3*(L1*sin(q2 + q3) - L2*cos(q3))*(l3 + L1*cos(q2 + q3) + L2*sin(q3)) - l3*m3*(L1*sin(q2 + q3) - L2*cos(q3)) - m3*(L1*cos(q2 + q3) + L2*cos(q3))*(L1*sin(q2 + q3) + L2*sin(q3));
    Gamma312 = (m3*(L1*sin(q2 + q3) - L2*cos(q3))*(l3 + L2*cos(q3)))/2 - (L2*m3*sin(q3)*(L1*cos(q2 + q3) + L2*cos(q3)))/2 - (L1*l3*m3*sin(q2 + q3))/2 - (L2*m3*cos(q3)*(L1*sin(q2 + q3) + L2*sin(q3)))/2 + (L2*m3*sin(q3)*(l3 + L1*cos(q2 + q3) + L2*sin(q3)))/2;
    Gamma313 = 0;
    Gamma322 = L2*m3*sin(q3)*(l3 + L2*cos(q3)) - L2^2*m3*cos(q3)*sin(q3);
    Gamma323 = 0;

    C11 = Gamma112*qdot2 + Gamma113*qdot3;
    C12 = Gamma112*qdot1 + Gamma122*qdot2 + Gamma123*qdot3;
    C13 = Gamma113*qdot1 + Gamma123*qdot2 + Gamma133*qdot3;
    C21 = Gamma211*qdot1 + Gamma212*qdot2 + Gamma213*qdot3;
    C22 = Gamma212*qdot1 + Gamma223*qdot3;
    C23 = Gamma213*qdot1 + Gamma223*qdot2 + Gamma233*qdot3;
    C31 = Gamma311*qdot1 + Gamma312*qdot2 + Gamma313*qdot3;
    C32 = Gamma312*qdot1 + Gamma322*qdot2 + Gamma323*qdot3;
    C33 = Gamma313*qdot1 + Gamma323*qdot2;

    C = [C11 C12 C13;
         C21 C22 C23;
         C31 C32 C33;];
end