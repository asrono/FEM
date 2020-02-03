%% Main

%% Input variables
x1 = 0;
xn = 1;
n = 5;

%% Handle input
GenerateMesh;
GenerateTopology;
AssembleMatrix;

disp(x);
disp(elmat);