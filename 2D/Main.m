%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;

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
              0.6*sin(2/5*pi*((1:5)-1)),0] + 11*eps;

%% Run main program
AP3001Mesh;
% Selem_vec = zeros(n,3,3);
% felem_vec = zeros(n,3);
% for i = 1:n
%     GenerateElementMatrix2;
%     Selem_vec(i,:,:) = Selem;
% 
%     GenerateElementVector2
%     check_vec(i,:) = check;
% 
%     felem_vec(i,:) = felem;
% end
% n_bnd = size(elmatbnd,1);
% 
% BMelem_vec = zeros(n_bnd,2,2);
% bfelem_vec = zeros(n_bnd,2);
% 
% for i = 1:n_bnd
%     GenerateBoundaryElementMatrix;
%     BMelem_vec(i,:,:) = BMelem;
%     
%     GenerateBoundaryElementVector;
%     bfelem_vec(i,:) = bfelem;
% end
BuildMatricesandVectors;
AP3001Comp;
AP3001Post;
% AssembleVector;
% u = S\f;

%% 
figure(5);
plot(x_vec_well(1,:),x_vec_well(2,:),'ok');
xlim(x_domain)
ylim(y_domain)
grid minor
title('Domain with sources')