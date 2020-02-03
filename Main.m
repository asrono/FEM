%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;

%% Input variables
x1 = 0;
xn = 1;
n = 8;
D = 1;
lambda = 1;

%% Handle input
GenerateMesh;
GenerateTopology;
GenerateElementMatrix1D;
AssembleMatrix;

disp(x);
disp(elmat);
disp(S);