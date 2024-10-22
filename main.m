clc, clear, close

global L1 L2 L3 g m1 m2 m3
format long
g = 9.81;
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

%gain adjustment
Kp = 20;
Kd = 2*sqrt(20);

step = 1; 
dt = 0.01;
t = 0 ;
t_max = 0.05; 
a = 0;
b = 0;

% Initial conditions
q1 = 0;
q2= 0;
q3 = 0;
qdot1= 0;
qdot2 = 0;
qdot3 = 0;
qdotdot1 =0;
qdotdot2 = 0;
qdotdot3 = 0;
tau_1 = 0;
tau_2 = 0;
tau_3 = 0;

 Position = MGD(q1, q2, q3);
 Xd = Position(1);
 Yd = Position(2);

% Desired position at start 
q1_desire = 0;
q2_desire = 0;
q3_desire = 0;

q_desire = [q1_desire ; q2_desire; q3_desire];

% Desired speed at start 
qdot1_desire = 0;
qdot2_desire = 0;
qdot3_desire = 0;

qdot_desire = [qdot1_desire ; qdot2_desire; qdot3_desire];

% Desired acceleration at start 
qdotdot1_desire = 0;
qdotdot2_desire = 0;
qdotdot3_desire = 0;

qdotdot_desire = [qdotdot1_desire; qdotdot2_desire; qdotdot3_desire];

% Arrays initialisation
num_steps = ceil(t_max / dt); 
time_array = zeros(num_steps, 1); 
q1_array = zeros(num_steps, 1); 
q2_array = zeros(num_steps, 1); 
q3_array = zeros(num_steps, 1); 
qdot1_array = zeros(num_steps, 1); 
qdot2_array = zeros(num_steps, 1); 
qdot3_array = zeros(num_steps, 1); 
qdotdot1_array = zeros(num_steps, 1); 
qdotdot2_array = zeros(num_steps, 1); 
qdotdot3_array = zeros(num_steps, 1); 
tau_1_array = zeros(num_steps, 1);
tau_2_array = zeros(num_steps, 1);
tau_3_array = zeros(num_steps, 1);

erreur_1_array = zeros(num_steps, 1);
erreur_2_array = zeros(num_steps, 1);
erreur_3_array = zeros(num_steps, 1);

% Workspace definition
pas = 15;
theta1 = -39:pas:45;
theta2 = -80:pas:100;
theta3 = -100:pas:10;

[Theta1,Theta2,Theta3] = meshgrid(theta1,theta2,theta3);

X_espace_de_travail = (L1*cosd(Theta1)+L2*cosd(Theta1+Theta2)+L3*cosd(Theta1+Theta2+Theta3));
Y_espace_de_travail = (L1*sind(Theta1)+L2*sind(Theta1+Theta2)+L3*sind(Theta1+Theta2+Theta3));


while a==0
    while b==0
        while t < t_max
            % Incrementation phase
            time_array(step) = t;
        
            tau_1_array(step) = tau_1;
            tau_2_array(step) = tau_2;
            tau_3_array(step) = tau_3;
        
            q1_array(step) = q1;
            q2_array(step) = q2;
            q3_array(step) = q3;
            q = [q1; q2 ; q3];
        
            qdot1_array(step) = qdot1;
            qdot2_array(step) = qdot2;
            qdot3_array(step) = qdot3;
            qdot = [qdot1; qdot2; qdot3];
        
            qdotdot1_array(step) = qdotdot1;
            qdotdot2_array(step) = qdotdot2;
            qdotdot3_array(step) = qdotdot3;
            qdotdot = [qdot1; qdot2; qdotdot3];
            
            %definition of position and speed errors
            error = [q1_desire - q1; q2_desire - q2; q3_desire - q3];
            error_dot = [qdot1_desire - qdot1; qdot2_desire - qdot2; qdot3_desire - qdot3];
        
            erreur_1_array(step) = error(1);
            erreur_2_array(step) = error(2);
            erreur_3_array(step) = error(3);
            
            % Call for external programmes
            M = Matrice_inertie(q);
            C = Coriolis(q,qdot);
            N = Matrice_gravite(q);
            
            % Pre-calculated torque control 
            tau = M*qdotdot_desire + M*(Kp*(error) + Kd*(error_dot)) + C*qdot + N;
        
            
            % Update with the equation of dynamics
            qdotdot = inv(M) * (tau - C*qdot - N); 
        
            % Integration to obtain joint speeds
            qdot1 = qdot1 + qdotdot(1) * dt; 
            qdot2 = qdot2 + qdotdot(2) * dt;
            qdot3 = qdot3 + qdotdot(3) * dt;
        
            % Integration to obtain the joint angles
            q1 = q1 + qdot1 * dt;
            q2 = q2 + qdot2 * dt;
            q3 = q3 + qdot3 * dt;

            % Live display 
            theta1 = rad2deg(q1);
            theta2 = rad2deg(q2);
            theta3 = rad2deg(q3);
            T01 = transformation(theta1,0,L1,0);
            T12 = transformation(theta2,0,L2,0);
            T23 = transformation(theta3,0,L3,0);
            T02 = T01*T12;
            T03 = T01*T12*T23;
        
            P0 = [0 0];
            P1 = transpose(T01(1:2,4));
            P2 = transpose(T02(1:2,4));
            P3 = transpose(T03(1:2,4));
            Q1 = [P0(1,1) P1(1,1) P2(1,1) P3(1,1)];
            Q2 = [P0(1,2) P1(1,2) P2(1,2) P3(1,2)];
            
            plot(Q1,Q2,'-o','LineWidth',4);
            axis([-0.8,0.8,-0.8,0.8]);
            grid on;

            Xinit = P3(1,1);Yinit = P3(1,2);
            Xend = Xd; Yend  = Yd;
            dX = (Xend-Xinit);
            dY = (Yend-Yinit);

            Dir_end = atan2d(Yend, Xend);
            Dir_init = atan2d(Yinit, Xinit);

            dis_error = sqrt((Xend-Xinit)^2+(Yend-Yinit)^2);
            orin_error = Dir_end - Dir_init;

            if abs(dis_error)<=10 && abs(orin_error)<=2
                b=1;
            end
        
            text(P3(1,1),P3(1,2),['(',num2str(P3(1,1),3),',',num2str(P3(1,2),3),')']);
            text(-0.7,-0.35,'Orientation Error =','Color','black','Interpreter', 'latex', 'FontSize',12);
            text(-0.28, -0.35, [num2str(abs(orin_error),3), '$^{\circ}$'],'Color','black','Interpreter', 'latex', 'FontSize',12);
            text(-0.7,-0.28,'Distance Error =','Color','black','Interpreter', 'latex', 'FontSize',12);
            text(-0.35, -0.28, [num2str(abs(dis_error),3), ' m'],'Color','black','Interpreter', 'latex', 'FontSize',12);
        
            hold on 
            grid on
            plot(X_espace_de_travail(:),Y_espace_de_travail(:),'r.');
            xlabel('X [m]','Interpreter', 'latex', 'fontsize',15)
            ylabel('Y [m]','Interpreter', 'latex', 'fontsize',15)
            title('Robot Arm Trajectory: Movement in the X-Y Plane','Interpreter', 'latex', 'fontsize',15)
            pause(0.001);
            hold off
            
            % Torques display
            tau_1 = tau(1);
            tau_2 = tau(2);
            tau_3 = tau(3);

            disp(['tau_1 = ', num2str(tau_1), ', tau_2 = ', num2str(tau_2), ', tau_3 = ', num2str(tau_3)]);

            t = t + dt;
            step = step+1;
        
        end

        if b == 1
            disp('choisissez un point dans l''espace de travail')
            
            [Xd,Yd] = ginput(1);
            
            b = 0;

            thetas = cine_inverse([Xd;Yd;0]);
            q1_desire = thetas(1);
            q2_desire = thetas(2);
            q3_desire = thetas(3);

           
            % Resetting variables and arrays
            step = 1; 
            dt = 0.01;
            t = 0 ;
            t_max = 2;  
            num_steps = ceil(t_max / dt); 
            time_array = zeros(num_steps, 1); 
            q1_array = zeros(num_steps, 1); 
            q2_array = zeros(num_steps, 1); 
            q3_array = zeros(num_steps, 1); 
            qdot1_array = zeros(num_steps, 1); 
            qdot2_array = zeros(num_steps, 1); 
            qdot3_array = zeros(num_steps, 1); 
            qdotdot1_array = zeros(num_steps, 1); 
            qdotdot2_array = zeros(num_steps, 1); 
            qdotdot3_array = zeros(num_steps, 1); 
            tau_1_array = zeros(num_steps, 1);
            tau_2_array = zeros(num_steps, 1);
            tau_3_array = zeros(num_steps, 1);
            
            erreur_1_array = zeros(num_steps, 1);
            erreur_2_array = zeros(num_steps, 1);
            erreur_3_array = zeros(num_steps, 1);

            
        end 
    end
end
