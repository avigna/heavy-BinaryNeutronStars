function misc_compactObjectCrossSection_analytical
tic;

% Macros
G = 4*pi*pi;
AUperYearToKmperSecond = 4.744;
RsolToAU = 0.00465047;

% Functions
rBH = @(Mco,Mstar,a,vshock) 2*G*Mco./((G.*(Mco+Mstar)./a)+(vshock.^2))
crossSection = @(RoverA) 0.5.*(1.0-(1.0./(1+(RoverA.*RoverA))))

% Analysis
separation = 6.0*RsolToAU;
% separationAUNS = 1.4*RsolToAU;
% separationSAUBH = 2.0*RsolToAU;
% separationSAUCHE = 5.1*RsolToAU;

vShock = linspace(0,2100,101);

rBHOveraNS = rBH(1.3,5.4,separation,vShock)./separation;
rBHOveraBH = rBH(15.0,28.0,separation,vShock)./separation;
rCHEOveraCHE = rBH(29.0,29.0,separation,vShock)./separation;

max(crossSection(rBHOveraBH))/max(crossSection(rBHOveraNS))
% Plot
sz=60;
fs=18;
lw=2.0;
alphaNum0=0.5;

stringX = '$v_{\rm shock}\ \rm{[km/s]}$';
stringY = '$\Omega/4\pi$';

clf
hold on
plot(vShock.*AUperYearToKmperSecond,crossSection(rBHOveraNS),'Linewidth',lw)
plot(vShock.*AUperYearToKmperSecond,crossSection(rBHOveraBH),'--','Linewidth',lw)
plot(vShock.*AUperYearToKmperSecond,crossSection(rCHEOveraCHE),':','Linewidth',lw)


xlabel(stringX,'Interpreter','Latex','FontSize',fs)
ylabel(stringY,'Interpreter','Latex','FontSize',fs)
title('$a=6.0\ \rm R_{\odot}$, e=0','Interpreter','Latex','FontSize',fs)
legend('$M_{\rm NS}=1.3\ M_{\odot},M_{\rm *}=5.4\ M_{\odot}$',...
       '$M_{\rm BH}=15\ M_{\odot},M_{\rm *}=28\ M_{\odot}$',...
       '$M_{\rm CHE}=29\ M_{\odot},M_{\rm *}=29\ M_{\odot}$',...
       'Interpreter','Latex','FontSize',fs)

set(gca,'Fontsize',fs)
box on
hold off
set(gca,'Yscale','log')

toc;
end