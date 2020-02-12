figure(1); movegui('west')
trisurf(elmat,x,y,u)
xlabel('$x [m]$')
ylabel('$y [m]$')
zlabel('$p [Pa]$')
title('Surface plot')

figure(2) ;movegui('center')
trisurf(elmat,x,y,u);
xlabel('$x [m]$')
ylabel('$y [m]$')
c = colorbar;
c.Label.String = '$p[Pa]$';
c.Label.Interpreter = 'latex';
c.TickLabelInterpreter = 'latex';
grid minor
view(2); shading interp; colormap jet; set(gcf,'renderer','zbuffer')
title('Contour plot')

figure(3); movegui('east')
if normalise_quivers
   norm = sqrt(v_x.^2+v_y.^2);
   v_x = v_x./norm;
   v_y = v_y./norm;
end
quiver(x,y,v_x',v_y',quiverscale,'Color',[0,0,0]); axis([-1 1 -1 1]); hold on
xlabel('$x [m]$')
ylabel('$y [m]$')
grid minor
title('Velocity plot')

figure(4);movegui('north')
plot(x_vec_well(1,:),x_vec_well(2,:),'ok');
xlim(x_domain)
ylim(y_domain)
grid minor
title('Domain with sources')