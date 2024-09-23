clc;
clear;

% Transfer function H(s) = (2ζs) / (s^2 + 2ζs + 1)
C_arr = [0.1, 0.5, 0.8, 1, 1.5];  % Damping ratios

% Initialize figure for plotting
figure;

for c = 1:length(C_arr)
    % Numerator and denominator for the transfer function
    numerator = [2 * C_arr(c) 0];          % [2ζs]
    denominator = [1 2 * C_arr(c) 1];      % [s^2 + 2ζs + 1]
    
    % Create the transfer function
    sys = tf(numerator, denominator);      % Transfer function H(s)
    
    % Plot Bode plot of the system
    bode(sys);
    hold on;   % Allow plotting of multiple curves
end

% Grid and legend for clarity
grid on;
legend(arrayfun(@(z) strcat('\zeta = ', num2str(z)), C_arr, 'UniformOutput', false));

% Add title to the plot
title('Bode Plot for Different Damping Ratios (\zeta)');
