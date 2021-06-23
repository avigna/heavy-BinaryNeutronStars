function app_MESA_timeEvolution
tic;

% Load data
dir ='../../../Data/Zenodo/MESA/';
filename_6_Msol = strcat(dir,'MESA_6_0_history.data')
history_6_Msol = read_mesa_stardotlogfile(filename_6_Msol)

filename_10_Msol = strcat(dir,'MESA_10_0_history.data')
history_10_Msol = read_mesa_stardotlogfile(filename_10_Msol)

% radius
% star_age
% star_mass
min(history_6_Msol.timeseries.star_mass)
min(history_10_Msol.timeseries.star_mass)

% Plot
sz=10;
fs=18;

stringY = '$\rm Radius\ [R_{\odot}]$';
stringX = '$\rm Time\ [yr]$';

clf
hold on
scatter(history_6_Msol.timeseries.star_age,history_6_Msol.timeseries.radius,sz,history_6_Msol.timeseries.star_mass,'o','Filled','HandleVisibility','Off')
scatter(history_10_Msol.timeseries.star_age,history_10_Msol.timeseries.radius,sz,history_10_Msol.timeseries.star_mass,'s','Filled','HandleVisibility','Off')


scatter(10^7,5,sz,11,'HandleVisibility','Off')
scatter(10^7,5,sz,4,'o','Filled')
scatter(10^7,5,sz,4,'s','Filled')


ylabel(stringY,'Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
set(gca,'Fontsize',fs)
ylim([0 2.5])
box on
hold off

c = colorbar;
c.Label.Interpreter = 'latex';
c.Label.FontSize = fs;
c.Label.String = '$\rm Mass\ [M_{\odot}]$';
c.Ticks = [4:10];
c.Limits = [4 10];

colormap(pink(1000))

print(gcf,'./Plots/MESA_timeEvolution.pdf','-dpdf');

toc;
end