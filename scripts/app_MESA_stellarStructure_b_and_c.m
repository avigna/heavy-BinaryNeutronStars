function app_MESA_stellarStructure_b_and_c
tic;

dir ='/Users/alejandro/Dropbox/Alejandro_CE_SN/doubleNeutronStar-supernova/stellarProfiles/';

filename_10_Msol = strcat(dir,'MESA_10_0_final_profile.data')
logdata_10_Msol = read_mesa_logfile(filename_10_Msol)

% Plot
sz=10;
fs=18;
lw=2.0;
alphaNum0=0.7;
alphaNum1=0.2;

stringX = '$\rm Radial\ Coordinate\ [R_{\odot}]$';
stringY = '$\rm Mass\ Coordinate\ [M_{\odot}]$';

clf
hold on
plot(10.^logdata_10_Msol.structure.logR,logdata_10_Msol.structure.mass,'Linewidth',lw)
text(4,0.5,'\textbf{b}','Fontsize',fs,'Interpreter','latex')
ylabel(stringY,'Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
set(gca,'Fontsize',fs)
xlim([10^-4 10])
box on
hold off
set(gca,'Xscale','log')
print(gcf,'./Plots/MESA_RadiusVsMass.pdf','-dpdf');

figure()
hold on
plot(10.^logdata_10_Msol.structure.logR,logdata_10_Msol.structure.logRho,'Linewidth',lw)
text(4,-8,'\textbf{c}','Fontsize',fs,'Interpreter','latex')
ylabel('$\log_{10}\ \rho\ \rm{[g/cm^3]}$','Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
set(gca,'Fontsize',fs)
xlim([10^-6 10])
box on
hold off
set(gca,'Xscale','log')
print(gcf,'./Plots/MESA_RadiusVsDensity.pdf','-dpdf');

toc;
end