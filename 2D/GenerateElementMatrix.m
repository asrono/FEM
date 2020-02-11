%% GenerateElementMatrix.m
% This routine will generate the element matrix

%% Implementation
A = [1 ,-1;
    -1, 1];
B = [2 ,1;
     1, 2];
 
h = 1/(n-1);

S_elem = D/h*A+lambda*h/6*B;