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
quiver(x,y,v_x',v_y',1.7,'Color',[0,0,0]); axis([-1 1 -1 1]); hold on
xlabel('$x [m]$')
ylabel('$y [m]$')
grid minor
title('Velocity plot')