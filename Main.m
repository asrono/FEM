%% Main

%% Input variables
x1 = 0;
xn = 1;
n = 5;

%% Handle input
x = GenerateMesh(x1,xn,n);
elmat = GenerateTopology(n);

disp(x);
disp(elmat);