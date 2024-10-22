function M = Matrice_inertie(q)
    m1 = 1;
    m2 = 1;
    m3 = 0.5;
    L1 = 0.3;
    L2 = 0.32;
    L3 = 0.08;
    l1 = L1/2;
    l2 = L2/2;
    l3 = L3/2;
    
    Izz1 = (m1/12)*(L1^2);
    Izz2 = Izz1;
    Izz3 = Izz1;
    
    
    I_tilde_1 = [Izz1 0 0; 0 m1 0; 0 0 m1];
    I_tilde_2 = [Izz2 0 0; 0 m2 0; 0 0 m2];
    I_tilde_3 = [Izz3 0 0; 0 m3 0; 0 0 m3];
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);


    c2 = cos(q2);
    c3 = cos(q3);
    
    s2 = sin(q2);
    s3 = sin(q3);

    c23 = cos(q2 + q3);
    s23 = sin(q2 + q3);

    J1 = [ 1 0 0;
           0 0 0;
           l1 0 0];

    J2 = [ 1 1 0;
           L1*s2  0  0;
           L1*c2+l2  l2  0];

    J3 = [ 1 1 1;
           s23*L1+s3*L2  s3*L2  0;
           L1*c23+L2*s3+l3  L2*c3+l3   l3];
    
    
    M = transpose(J1)*I_tilde_1*J1 + transpose(J2)*I_tilde_2*J2+ transpose(J3)*I_tilde_3*J3;
    
end