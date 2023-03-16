%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'WEC.slx';      % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer = 'off';                   % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                     % Simulation Start Time [s]
simu.rampTime = 100;                    % Wave Ramp Time [s]
simu.endTime = 300;                     % Simulation End Time [s]
simu.dt = 0.01;  
simu.cicEndTime = 30;
simu.rho = 1025;
%simu.mcrMatFile = 'mcrExample.mat';
simu.saveWorkspace = 0;

%Regular Waves  
waves = waveClass('regular');           % Initialize Wave Class and Specify Type                                 
waves.height = 2;                     % Wave Height [m]
waves.period = 5;                       % Wave Period [s]

%% Body Data
% Float
body(1) = bodyClass('hydroData/DS4.h5');      
    % Create the body(1) Variable, Set Location of Hydrodynamic Data File 
    % and Body Number Within this File.   
body(1).geometryFile = 'geometry/DS4_AD.stl';    % Location of Geomtry File
body(1).mass = 861451.926;                   
    % Body Mass. The 'equilibrium' Option Sets it to the Displaced Water 
    % Weight.
%body(1).centerGravity=[0 0 -0.12];
body(1).inertia = [16748401.10 17172515.30 14101191.89];  % Moment of Inertia [kg*m^2]     
body(1).linearDamping = [98329 0 0 0 0 0;0 0 0 0 0 0;0 0 70472.814 0 0 0;0 0 0 0 0 0;0 0 0 0 1507244.04 0;0 0 0 0 0 0];
%body(1).initial.angle=0.1;
body(1).viz.opacity = 0.5;
body(1).nonlinearHydro = 2;


%% PTO and Constraint Parameters
% Floating (3DOF) Joint
constraint(1) = constraintClass('Constraint1'); % Initialize Constraint Class for Constraint1
constraint(1).location = [0 0 0];               % Constraint Location [m]
%%Heave Restriction Constraint

%% Mooring 
mooring(1) = mooringClass('mooring');           % Initialize mooringClass
mooring(1).moorDynLines = 4;                    % Specify number of lines
mooring(1).moorDynNodes(1:4) = 15;              % Specify number of nodes per line
mooring(1).initial.displacement = [0 0 0];  % Initial Displacement

