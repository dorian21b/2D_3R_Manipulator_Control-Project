function fig = figure_torque(time_array, tau_1_array, tau_2_array, tau_3_array)
    fig = figure;
    
    plot(time_array, tau_1_array);
    hold on;
    plot(time_array, tau_2_array);
    plot(time_array, tau_3_array);
    grid minor;
    xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('Torque [Nm]', 'Interpreter', 'latex', 'FontSize', 12);
    legend('$\tau_1$', '$\tau_2$', '$\tau_3$', 'Interpreter', 'latex', 'FontSize', 12, 'Location', 'northeast');
            
end