%% GenerateTopology.m
% This file will create a 2 dimensional array which contains the indices of
% the vertices of each element.

%% Implementation
function elmat = GenerateTopology(n)
    elmat(:,1) = 1:(n-1);
    elmat(:,2) = 2:n;
end