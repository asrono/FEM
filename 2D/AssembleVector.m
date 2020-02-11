%% AssembleVector.m
% This routine will assemble the right-hand vector

%% Implementation
f = zeros(1,n)';
for i = 1:(n-1)
    for j = 1:2
        f(elmat(i, j)) = f(elmat(i, j)) + f_elem(i,j);
    end
end