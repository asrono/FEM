%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution
Preamble;

%% Input variables
Qp  = 50;       % [m^2/s]
k   = 1e-7;     % [m^2]
mu  = 1.002e-3; % [Pa s]
K   = 10;       % [m/s]
ph  = 1e6;      % [Pa]
number_of_refinements = 1;

% Define domain and well
x_domain = [-1, 1];     % [m]
y_domain = [-1, 1];     % [m]
x_vec_well = [0.6*cos(2/5*pi*((1:5)-1)),0;
              0.6*sin(2/5*pi*((1:5)-1)),0];

% Bool for setting half the wells to sources
comp = false; % if true, one can set K to 0

% Play with the scale of the quivers
quiverscale = 0.8;
normalise_quivers = true;
%% Run main program
AP3001Mesh;
AP3001Comp;
AP3001Post;