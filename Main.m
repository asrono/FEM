%% femsolve1d.m
% This file will assemble an FEM problem and compute the solution

Preamble;
opt = 2; % if 1, do f(x)=1, if 2, do f(x)=sin(20x)

%% Input variables
x1 = 0;
xn = 1;
D = 1;
lambda = 1;

if opt == 1
fun = @(x) 1;
n_vec = 1e2;
figure_linetypes = {'.-k'};
end
if opt == 2
fun = @(x) sin(20*x);
n_vec = [10,20,40,80,160];
figure_linetypes = {'o-k','x-k','--k','-.k','-k'};
fun_exact = @(x) -(exp(-x).*(-20*exp(2*x) + exp(x).*sin(20*x) - exp(x+2).*sin(20*x) + 20*exp(2*x + 1).*cos(20) - 20*exp(2) + 20*exp(1)*cos(20)))./(401*(exp(2) - 1));
error_inf = zeros(1,numel(n_vec));
end

%% Setup forloop
% plotting
figure(1); hold on; movegui('center')
figure(5); hold on; movegui('southwest');
ind = 1;
for n = n_vec
%% Run main program
GenerateMesh;
GenerateTopology;
GenerateElementMatrix;
AssembleMatrix;
GenerateElementVector;
AssembleVector;
u = S\f;

figure(1);
plot(x,u,figure_linetypes{ind});

%% error analysis for case 2
if opt == 2
exact = fun_exact(x)';
error = abs(exact-u);
error_inf(ind) = max(error);

figure(5)
if(~(ind==1||ind==2))
plot(x,error,figure_linetypes{ind});
end
end
ind = ind+1;
end
%% Plotting
figure(1);
hold off;
title('Solution with neuman boundaries');
grid minor
ylim([0,0.05]);
xlabel('$x$');
ylabel('$u(x)$');
if opt == 1
   ylim([0,1.2]); 
end
if opt == 2
    legend({'n = 10', 'n = 20','n = 40','n = 80','n = 160'},'Interpreter','Latex')
    figure(5);
    title('Exact error in solution');
    grid minor
    xlabel('$x$');
    ylabel('$|u(x) - u_\textrm{ex}(x) |$');
    legend({'n = 40','n = 80','n = 160'},'Interpreter','Latex')
end

%% Error analysis
if opt == 2
h = 1./(n_vec-1);
log_h = log(h);
log_error_inf = log(error_inf);
[xData1, yData1] = prepareCurveData( log_h, log_error_inf);
% Set up fittype and options.
ft = fittype( 'poly1' );
% Fit model to data.
[fitresult_error, ~] = fit( xData1, yData1, ft );

figure(2); hold on; movegui('northeast');
plot(h,error_inf,'ok');
xlabel('$h$');
ylabel('$\Vert \mathbf{u} - \mathbf{u}_\textrm{ex} \Vert$');
grid minor

figure(3); movegui('southeast');
loglog(h,error_inf,'ok'); hold on;
loglog(h, exp(fitresult_error(log(h))),'--k');
xlabel('$h$');
ylabel('$\Vert \mathbf{u} - \mathbf{u}_\textrm{ex} \Vert$');
grid minor
legend({'Data points','Linear fit'},'Interpreter','Latex','Location','Northwest');

figure(4); movegui('northwest');
plot(x,fun_exact(x),'-k');
title('Exact solution with neuman boundaries');
grid minor
xlabel('$x$');
ylabel('$u(x)$');
ylim([0,0.05]);

confint_error = confint(fitresult_error);
confint_error = confint_error(1:2,1);
fprintf('The slope of log(error) vs log(h) is %.3f with 95 %% confidence interval (%.3f , %.3f). \n',fitresult_error.p1, confint_error(1), confint_error(2))
end