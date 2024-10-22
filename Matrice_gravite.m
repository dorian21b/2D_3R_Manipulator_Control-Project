function N = Matrice_gravite(q)
    m1 = 1;
    m2 = 1;
    m3 = 0.5;
    L1 = 0.3;
    L2 = 0.32;
    L3 = 0.08;
    l1 = L1/2;
    l2 = L2/2;
    l3 = L3/2;
    g = 9.81;

    q1 = q(1);
    q2 = q(2);
    q3 = q(3);

    c1 = cos(q1);
    c12 = cos(q1 + q2);
    c123 = cos(q1+q2+q3);
    
    g1 = g*c1*(m1*l1 + m2*L1 + m3*L1) + m2*g*l2*c12 + m3*g*(L2*c12 + l3*c123);
    g2 = m2*g*l2*c12 + m3*g*(L2*c12 + l3*c123);
    g3 = m3*g*l3*c123;
    N = [g1 ; g2; g3];

end

