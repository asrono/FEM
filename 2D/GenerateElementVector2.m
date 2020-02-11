
% Module for element mass matrix for reactive term
%
% Output: felem  ====== vector of two components
%
% felem(1), felem(2) to be computed in this routine.

clear felem

cond = false;
cond2 = false;
for j = 1:6
    xp = x_vec_well(1,j);
    yp = x_vec_well(2,j);
    Delta1 = det([1 xp yp;1 xc(2) yc(2);1 xc(3) yc(3)]);
    Delta2 = det([1 xc(1) yc(1);1 xp yp;1 xc(3) yc(3)]);
    Delta3 = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xp yp]);
    Delta_check = abs(Delta1)+abs(Delta2)+abs(Delta3);
    check(j) = abs(abs(Delta)-abs(Delta_check));
    if check(j) <= 100*eps
        cond = true;
%         if j == 6
%            cond2 = true; 
%         end
        break;
    end
end


for index1 = 1:topology
		felem(index1) = 0;
        if cond
            felem(index1) = Qp;
        end
        if cond2
           felem(index1) = -Qp; 
        end
end;