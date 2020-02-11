%% AssembleMatrix.m
% This routine will assemble the element matrix S

%% Implementation
S = zeros(n);
for i = 1:(n-1)
    for j = 1:2
        for k = 1:2
            S(elmat(i,j),elmat(i,k)) = S(elmat(i,j),elmat(i,k)) + S_elem(j,k);
        end
    end
end