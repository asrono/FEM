Geometry = 'squareg'; 
DiffCoeff = k/mu;

h_transfer = 1;
[p,e,t] = initmesh(Geometry);

ind_ref = number_of_refinements;
while ind_ref > 0
    [p,e,t] = refinemesh(Geometry,p,e,t); % gives gridrefinement
    ind_ref = ind_ref - 1;
end

x = p(1,:); y = p(2,:);
n = length(p(1,:));

elmat = t(1:3,:);
elmat = elmat';
elmatbnd = e(1:2,:);
elmatbnd = elmatbnd';

topology = 3; topologybnd = 2;
