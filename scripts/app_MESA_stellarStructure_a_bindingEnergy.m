function app_MESA_stellarStructure_a_bindingEnergy
tic;

% MACROS
Gcgs=6.67430*10^-8;
MsolTog = 1.989*10^33;
RsolTocm = 6.957*10^10;

% Load data
dir ='../../../Data/Zenodo/MESA/';
filename_10_Msol = strcat(dir,'MESA_10_0_final_profile.data')
logdata_10_Msol = read_mesa_logfile(filename_10_Msol)

% Calculate binding energy
mass_10_Msol_Msol = flip(logdata_10_Msol.structure.mass);
mass_10_Msol_g = mass_10_Msol_Msol.*MsolTog;
dm_10_Msol_g = diff([0.0; mass_10_Msol_g]);
radius_10_Msol_Rsol = flip((10.^logdata_10_Msol.structure.logR));
radius_10_Msol_cm = radius_10_Msol_Rsol.*RsolTocm;
specific_Ebind_10_Msol_cgs = -Gcgs.*mass_10_Msol_g./radius_10_Msol_cm;
Ebind_10_Msol_cgs = Gcgs.*mass_10_Msol_g.*dm_10_Msol_g./radius_10_Msol_cm;
cum_sum_Ebind_10_Msol_cgs = cumsum(Ebind_10_Msol_cgs);

% Plot
sz=10;
fs=18;
lw=2.0;
alphaNum0=0.7;
alphaNum1=0.2;

stringY = '$\rm |\textit{E}_{bind,grav}|\ [erg]$';
stringX = '$\rm Radius\ [R_{\odot}]$';

clf
hold on
plot(radius_10_Msol_Rsol,(cum_sum_Ebind_10_Msol_cgs),'Linewidth',lw)
text(4,0.5*10^51,'\textbf{a}','Fontsize',fs,'Interpreter','latex')
ylabel(stringY,'Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
set(gca,'Fontsize',fs)
set(gca,'XScale','log')
xlim([10^-4 10])
box on
hold off
print(gcf,'./Plots/MESA_plottingBindingEnergy.pdf','-dpdf');

toc;
end