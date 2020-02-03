%% GenerateElementVector1d.m
% This routine will create the element matrix

%% Implementation
f_elem = zeros(n-1,2);
f_elem(:,1) = h/2*fun(x(elmat(:,1)));
f_elem(:,2) = h/2*fun(x(elmat(:,2)));