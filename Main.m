%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;

%% Input variables
x1 = 0;
xn = 1;
D = 1;
lambda = 1;
n_vec = [10,20,40,80,160];
for n = n_vec
%% Handle input
GenerateMesh;
GenerateTopology;
GenerateElementMatrix1D;
AssembleMatrix;
GenerateElementVector1d;
AssembleVector;

u = S\f;

figure(1);
plot(x,u); hold on;
% ylim([0,1.2])
end
title('Solution with neuman boundaries');
grid minor
xlabel('$x$');
ylabel('$u(x)$');
legend({'n = 10', 'n = 20','n = 40','n = 80','n = 160',},'Interpreter','Latex')