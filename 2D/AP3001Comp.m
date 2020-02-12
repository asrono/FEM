% Construction of linear problem
BuildMatricesandVectors;

% Solution of linear problem
u = S \ f;
v_x = M \ (C_x*u);
v_y = M \ (C_y*u);