
% Module for element mass matrix for reactive term
%
% Output: Selem  ====== 2 x 2 matrix
%
% Selem(1,1), Selem(1,2), Selem(1,3), Selem(2,1), Selem(2.2), Selem(2,3),
%
% Selem(3,1), Selem(3,2), Selem(3,3) to be computed in this routine.
%
% elmat(i,1), elmat(i,2), elmat(i,3) give the index numbers of the vertices of element i
%
% x(elmat(i,j)), y(elmat(i,j)) give the coordinates of the vertices
%
% i = index number of element, imported from AssemblyStepStiffnessMatrix.m
%
% Selem(index1,index2) = (grad phi(elmat(i,index1)),grad phi(i,index2))
%

clear xc
clear yc
clear Selem

for index1 = 1:topology
	xc(index1) = x(elmat(i,index1));
	yc(index1) = y(elmat(i,index1));
end;

Delta = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)]);

B_mat = [1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)] \  eye(3);

alpha = B_mat(1,1:3);
beta  = B_mat(2,1:3);
gamma = B_mat(3,1:3);

for index1 = 1:topology
	for index2 = 1:topology
		Selem(index1,index2) = abs(Delta)/2*DiffCoeff*(beta(index1)*beta(index2)+gamma(index1)*gamma(index2));
	end;
end;