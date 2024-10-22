function fig = figure_qdotdot(time_array, qdotdot1_array, qdotdot2_array, qdotdot3_array)
    fig = figure;
    
    plot(time_array, qdotdot1_array);
    hold on;
    plot(time_array, qdotdot2_array);
    plot(time_array, qdotdot3_array);
    grid minor;
    xlabel('Temps [s]', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('Joint Accelerations [$rad.s^{-2}$]', 'Interpreter', 'latex', 'FontSize', 12);
    legend('$\ddot{q}_1$', '$\ddot{q}_2$', '$\ddot{q}_3$', 'Interpreter', 'latex', 'FontSize', 12, 'Location', 'northeast');
            
end