function figure4_b_coalescenceTimeDNS
tic;

% MACROS
DayToSeconds=24*60*60;
SecondsToDays=1/DayToSeconds;
RsolToAU = 0.00465047;
AUToRsol = 1/RsolToAU;

% Pre-SN quantities: circular (e=0) and no natal kick
numMassBins = 100;
numSepBins = 100;

MnsCompanion = 1.3; % Msol
MnsExploding = 3.0; % Msol
dm=0.01;
3*MnsExploding+dm
Mf_preSN = linspace(MnsExploding+dm,3*MnsExploding+dm,numMassBins);
separationRsol_preSN = linspace(0.5,6,numSepBins);

[X,Y] = meshgrid(Mf_preSN,separationRsol_preSN);
deltaM = X - MnsExploding;
max(max(deltaM))

max(max(X))

% Post-SN quantities
[efinal,aFactorChange] = calculateBlaauwKick(X,MnsExploding,MnsCompanion);
eccentricity_postSN=efinal;
separationRsol_postSN = Y.*aFactorChange;
separationAU_postSN = separationRsol_postSN.*RsolToAU;
Pyear_postSN = sqrt(separationAU_postSN.^3/(MnsExploding+MnsCompanion));
Pseconds_postSN = Pyear_postSN*365*DayToSeconds;

coalescenceTimeMyr = zeros(numMassBins,numSepBins);
ageUniverseGyr=13.7;
for i=1:numMassBins
    for j=1:numSepBins
        if eccentricity_postSN(i,j)>= 1.0;
% coalescenceTimeMyr(i,j)=ageUniverseGyr*1000;
coalescenceTimeMyr(i,j)=nan;
        else
coalescenceTimeMyr(i,j) = solvingOrbitBNS(MnsExploding,MnsCompanion,Pseconds_postSN(i,j),eccentricity_postSN(i,j));
        end
    end
end

massMESA6 = 4.2;
deltaMMESA6 = massMESA6-MnsExploding;
radiusMESA6 = 2.3;
rocheRadiusMESA6 = calculateRocheRadius(massMESA6,MnsCompanion)
separationMESA6 = radiusMESA6/rocheRadiusMESA6;

massMESA10 = 5.4;
deltaMMESA10 = massMESA10-MnsExploding;
radiusMESA10 = 0.7
rocheRadiusMESA10 = calculateRocheRadius(massMESA10,MnsCompanion)
separationMESA10 = radiusMESA10/rocheRadiusMESA10

% massKepler = 5.1;
% deltaMKepler = massKepler-MnsExploding;
% radiusKepler = 2.8;
% rocheRadiusKepler = calculateRocheRadius(massKepler,MnsCompanion);
% separationKepler = radiusKepler/rocheRadiusKepler;

% Calculate more general Roche lobe
massRocheLobe = linspace(2.1,5.46,100);
rocheRadius = calculateRocheRadius(massRocheLobe,MnsCompanion);

% Calcualte initial masses
eccentricity = [0.1 0.2 0.3 0.6]
[initialMass] = calculateInitialMass(eccentricity,MnsExploding,MnsCompanion)
size(initialMass)
% Plot
sz=60;
fs=18;
lw=2.0;
alphaNum0=0.5;

stringX = '$\rm \textit{M}_{pre-SN}\ [M_{\odot}]$';
stringY = '$\rm \textit{a}_{pre-SN}\ [R_{\odot}]$';
stringTitle = sprintf('M_{NS,1}= %0.1f, M_{NS,exp} = %0.1f',MnsCompanion,MnsExploding);


maxDeltaM = 4.0;
N = 100;
xNS = linspace(0.0,MnsExploding+dm,N);
xUnbound = linspace(((2*MnsExploding)+MnsCompanion-0.03),7.0,N);
min(xUnbound)
max(xUnbound)
Y1 = repmat([0.5;6],1,N);

color1 = [         0    0.4470    0.7410];
color2 = [    0.8500    0.3250    0.0980];
color3 = [    0.9290    0.6940    0.1250];
color4 = [    0.4940    0.1840    0.5560];
color5 = [    0.4660    0.6740    0.1880];


%
clf
%-------------------------------------------------------------------------%
hold on
s=surf(X,Y,log10(coalescenceTimeMyr),'HandleVisibility','Off');
set(s, 'EdgeColor', 'none');

h0=fill([xNS flip(xNS)],[Y1(1,:) flip(Y1(2,:))],'k','EdgeColor','none','HandleVisibility','Off');
set(h0,'FaceAlpha',alphaNum0)% if size(y0,1)==2 %plot shaded area       

h1=fill([xUnbound flip(xUnbound)],[Y1(1,:) flip(Y1(2,:))],color1,'EdgeColor','none','HandleVisibility','Off');
set(h1,'FaceAlpha',alphaNum0)% if size(y0,1)==2 %plot shaded area       

numTop = 150;
scatter3(massMESA6,radiusMESA6,sz,numTop,'ks','HandleVisibility','Off')
scatter3(massMESA10,radiusMESA10,sz,numTop,'kd','HandleVisibility','Off')
% scatter3(massKepler,radiusKepler,sz,numTop,'kd','HandleVisibility','Off')

scatter3(massMESA6,separationMESA6,sz,numTop,'ks','Filled')
scatter3(massMESA10,separationMESA10,sz,numTop,'kd','Filled')
% scatter3(massKepler,separationKepler,sz,numTop,'kd','Filled')

% plot3(massRocheLobe,2.*rocheRadius,numTop.*ones(size(rocheRadius)),'--k')
% plot3(massRocheLobe,4.*rocheRadius,numTop.*ones(size(rocheRadius)),'--k')
% plot3(massRocheLobe,6.*rocheRadius,numTop.*ones(size(rocheRadius)),'--k')
% plot3(massRocheLobe,8.*rocheRadius,numTop.*ones(size(rocheRadius)),'--k')
% plot3(massRocheLobe,10.*rocheRadius,numTop.*ones(size(rocheRadius)),'--k')

hNS=text(0.2,3,numTop,'Neutron\ Star','FontSize',fs,'Color','w','Interpreter','Latex');
hInfo=text(3,5.5,numTop,'$t_{\rm{GW}}>H_{0}^{-1}$','FontSize',fs,'Color','k','Interpreter','Latex');
hLabel=text(0.2,5.5,numTop,'$\rm{\bf{b}}$','FontSize',fs,'Color','w','Interpreter','Latex');

hUnbound=text(6.6,4,numTop,'Unbound','FontSize',fs,'Color','w','Interpreter','Latex');
set(hUnbound,'Rotation',270);

% xline(initialMass(1),':','Color',color1,'Linewidth',lw,'Handlevisibility','off')
% xline(initialMass(2),'--','Color',color1,'Linewidth',lw,'Handlevisibility','off')
% xline(initialMass(3),'-.','Color',color1,'Linewidth',lw,'Handlevisibility','off')
% xline(initialMass(4),'Color',color1,'Linewidth',lw,'Handlevisibility','off')

% legend( 'MESA\_6',...
%         'MESA\_10',...
%         'Kepler\_16',...
%         'Interpreter','Latex',...
%         'Location','NorthWest',...
%         'Box','Off',...
%         'FontSize',fs)

% title(stringTitle,'FontSize',fs,'HandleVisibility','Off')
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
ylabel(stringY,'Interpreter','Latex','FontSize',fs)
ylim([0.5 6])
xlim([0 7])



set(gca,'Fontsize',fs)
box on
hold off
c = colorbar;
c.Label.Interpreter = 'latex';
c.Label.FontSize = fs;
c.Label.String = '$\rm \textit{t}_{GW}\ [Myr]$';
c.Ticks = [0:4];
c.TickLabels = {'1','10','100','1000','\approx H_{0}^{-1}'};
c.Limits = [0 4];

colormap(pink)
%-------------------------------------------------------------------------%
print(gcf,'./Plots/figure4_coalescenceTimeDNS_alt.pdf','-dpdf');


toc;
end




function [coalescenceTimeMyr] = solvingOrbitBNS(Mpulsar,Mcompanion,P,e0)
% MATLAB script to take the BNSs from COMPAS and evolving them forward in
% time until (a) merger or (b) 10 Gyr, the approximated age of the Milky
% Way
% Partly taken from Ilya's BNS notebook
Msunkg=1.98892e30;	%Msun in kg
c=299792458;		%speed of light, m/s
G=6.67428e-11;		%G in m^3/kg/s^2
Msun=G*Msunkg/c^3;  %Msun in seconds
Mpcm=1*10^6 * 3.0856775807e16;  %Mpc in meters
Mpc=Mpcm/c;         %Mpc in seconds
Gpc=1000*Mpcm/c;    %Gpc in seconds


% My constants
DayToSeconds=24*60*60;
SecondsToDays=1/DayToSeconds;

beta=64/5*G^3*(Mpulsar.*Mcompanion.*(Mpulsar+Mcompanion)*Msunkg^3)/c^5; 
a0=((P/2/pi).^2*G.*(Mpulsar+Mcompanion)*Msunkg).^(1/3); %P=2*pi*sqrt(a^3/mubin)
c0=a0.*(1-e0.^2).*e0.^(-12/19).*(1+121/304*e0.^2).^(-870/2299);

% Starting my own calculations
funLifetime = @(e) (12/19)*((c0.^4)./beta).*(e.^(29.0/19.0)).*((1+((121/304)*e.^2)).^(1181/2299)).*((1-e.^2).^(-3.0/2.0));
funSemiMajorAxis = @(e) c0.*(e.^(12.0/19.0)).*((1-e.^2).^(-1.0)).*(1+(121/304)*e.^2).^(870.0/2299.0);
TauGW = integral(@(e)funLifetime(e),0,e0)/3.15e7/1e9; %in Gyr; Peters & Mathews

ageUniverseGyr=13.7;
coalescenceTimeMyr=ageUniverseGyr*1000;
if TauGW<ageUniverseGyr
    coalescenceTimeMyr=TauGW*1000;
else
    coalescenceTimeMyr = nan;
end


end

function [initialMass] = calculateInitialMass(eccentricity,Mfinal,Mcompanion)
initialMass = (eccentricity.*(Mfinal+Mcompanion))+Mfinal;
end

function [efinal,aFactorChange] = calculateBlaauwKick(Minitial,Mfinal,Mcompanion)
% Following Postnov & Yungelson 2014, page 32
% Blaauw kick from spherically symmetric mass loss
% Following Vigna-Gomez+2020b (eqs. 2 and 3):
% Minitial    = M_{BH,1} + M_{BH,2}
% Mfinal      = (1-f_{rad})(M_{BH,1} + M_{BH,2}) = M_{BBH,in}
% Mcompanion  = M_{BH,3}
chi = (Minitial+Mcompanion)./(Mfinal+Mcompanion);
aFactorChange = 1./(2-chi);
efinal = (Minitial-Mfinal)./(Mfinal+Mcompanion);

efinal(find(efinal==0.0))=10^-6;
efinal(find(efinal>1))=1;
aFactorChange(find(aFactorChange<1))=inf;

end

function [rocheRadius] = calculateRocheRadius(Md,Ma)
% Roche radius following Eggleton 1983.
% rocheRadius as seen by star 1, e.g. donor star.
q = Md./Ma;
rocheRadius = 0.49./(0.6+(log(1+q.^(1.0./3))./(q.^(2.0./3))));
end