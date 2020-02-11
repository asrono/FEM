%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;
opt = 2; % if 1, do f(x)=1, if 2, do f(x)=sin(20x)

%% Input variables
Qp  = 50;       % [m^2/s]
k   = 1e-7;     % [m^2]
mu  = 1.002e-3; % [Pa s]
K   = 10;       % [m/s]
ph  = 1e6;      % [Pa]

x_domain = [-1, 1];     % [m]
y_domain = [-1, 1];     % [m]

%% wells
x_vec_well = [0.6*cos(2/5*pi*((1:5)-1)),0;
              0.6*sin(2/5*pi*((1:5)-1)),0];

%% Run main program
% GenerateMesh;
% GenerateTopology;
% GenerateElementMatrix;
% AssembleMatrix;
% GenerateElementVector;
% AssembleVector;
% u = S\f;

%% 
figure(1);
plot(x_vec_well(1,:),x_vec_well(2,:),'ok');
xlim(x_domain)
ylim(y_domain)
grid minor
title('Domain with sources')