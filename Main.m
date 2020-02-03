%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;

%% Input variables
x1 = 0;
xn = 1;
n = 100;
D = 1;
lambda = 1;

%% Handle input
GenerateMesh;
GenerateTopology;
GenerateElementMatrix1D;
AssembleMatrix;
GenerateElementVector1d;
AssembleVector;

% disp(x);
% disp(elmat);
% disp(S);
% disp(f);

u = S\f;

figure(1);
plot(x,u); hold on
ylim([0,1.2])
title('Solution with neuman boundaries');
grid minor
xlabel('$x$');
ylabel('$u(x)$');