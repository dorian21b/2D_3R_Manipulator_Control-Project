function fig = figure_qdot(time_array, qdot1_array, qdot2_array, qdot3_array)
    fig = figure;
    
    plot(time_array, qdot1_array);
    hold on;
    plot(time_array, qdot2_array);
    plot(time_array, qdot3_array);
    grid minor;
    xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('Joint Velocities [$rad.s^{-1}$]', 'Interpreter', 'latex', 'FontSize', 12);
    legend('$\dot{q}_1$', '$\dot{q}_2$', '$\dot{q}_3$', 'Interpreter', 'latex', 'FontSize', 12, 'Location', 'northeast');
            
end