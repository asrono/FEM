figure(2);
trisurf(elmat,x,y,u)
figure(3);
trisurf(elmat,x,y,u);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer')

figure(4);

norm = sqrt(v_x.^2+v_y.^2);
% v_x=v_x/norm;
% v_y=v_y/norm;
quiver(x,y,v_x',v_y',2); axis([-1 1 -1 1]); hold on
grid minor

% contour(elmat,x,y,u);hold off;