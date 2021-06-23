function app_COMPAS_coreMass_CEE_CDF(dir,plotFlag,savePlot,debugFlag)
%
% dir: specify directory path as '/DIR/TO/SPECIFY/' or [] for empty dir.
% plotFlag: if true, plots; else, not.
% savePlot: if true, saves; else, not. Only used if plotFlag is true.
% debugFlag: if true, prints values to terminal; else, not.

% MACRO
NEUTRON_STAR = 13;          % As used in COMPAS, originally defined by Hurley+2000
massEvolvedFactor = 4.0;    % Multiplicative factor to account for the non-simulated mass

% Specify where is the output 
if exist(dir)~=1
    dir = '../../../Data/COMPAS/v02.19.01/10M/';
end

if plotFlag~=1
    plotFlag = 0;
end

if savePlot~=1
    savePlot = 0;
end

if debugFlag~=1
    debugFlag = 0;
end

if debugFlag
    dir
    plotFlag
    savePlot
    debugFlag
end

% Load data
% commonEnvelopes
% Z=0.0001
filename_Z_0_0001 = strcat(dir,'Z_0_0001/COMPAS_Output_Z_0_0001.h5');
stellarType1_Z_0_0001 =h5read(filename_Z_0_0001,'/BSE_Common_Envelopes/Stellar_Type(1)');
stellarType2_Z_0_0001 =h5read(filename_Z_0_0001,'/BSE_Common_Envelopes/Stellar_Type(2)');
massCore2_Z_0_0001 =h5read(filename_Z_0_0001,'/BSE_Common_Envelopes/Core_Mass(2)');
indexOfInterest_Z_0_0001 = find(  stellarType1_Z_0_0001 == NEUTRON_STAR & ...
                        stellarType2_Z_0_0001 > 1 & ...
                        stellarType2_Z_0_0001 < 9);
                    
massZAMS1_Z_0_0001 =h5read(filename_Z_0_0001,'/BSE_System_Parameters/Mass@ZAMS(1)');
massZAMS2_Z_0_0001 =h5read(filename_Z_0_0001,'/BSE_System_Parameters/Mass@ZAMS(2)');
totalMassZAMS_Z_0_0001 = sum(massZAMS1_Z_0_0001)+sum(massZAMS2_Z_0_0001);
realMass_Z_0_0001 = massEvolvedFactor*totalMassZAMS_Z_0_0001;
                                 
length(massZAMS1_Z_0_0001)
% Z=0.0010
filename_Z_0_0010 = strcat(dir,'Z_0_0010/COMPAS_Output_Z_0_0010.h5');
stellarType1_Z_0_0010 =h5read(filename_Z_0_0010,'/BSE_Common_Envelopes/Stellar_Type(1)');
stellarType2_Z_0_0010 =h5read(filename_Z_0_0010,'/BSE_Common_Envelopes/Stellar_Type(2)');
massCore2_Z_0_0010 =h5read(filename_Z_0_0010,'/BSE_Common_Envelopes/Core_Mass(2)');
indexOfInterest_Z_0_0010 = find(  stellarType1_Z_0_0010 == NEUTRON_STAR & ...
                        stellarType2_Z_0_0010 > 1 & ...
                        stellarType2_Z_0_0010 < 9);

massZAMS1_Z_0_0010 =h5read(filename_Z_0_0010,'/BSE_System_Parameters/Mass@ZAMS(1)');
massZAMS2_Z_0_0010 =h5read(filename_Z_0_0010,'/BSE_System_Parameters/Mass@ZAMS(2)');
totalMassZAMS_Z_0_0010 = sum(massZAMS1_Z_0_0010)+sum(massZAMS2_Z_0_0010);
realMass_Z_0_0010 = massEvolvedFactor*totalMassZAMS_Z_0_0010;

% Z=0.0100
filename_Z_0_0100 = strcat(dir,'Z_0_0100/COMPAS_Output_Z_0_0100.h5');
stellarType1_Z_0_0100 =h5read(filename_Z_0_0100,'/BSE_Common_Envelopes/Stellar_Type(1)');
stellarType2_Z_0_0100 =h5read(filename_Z_0_0100,'/BSE_Common_Envelopes/Stellar_Type(2)');
massCore2_Z_0_0100 =h5read(filename_Z_0_0100,'/BSE_Common_Envelopes/Core_Mass(2)');
indexOfInterest_Z_0_0100 = find(  stellarType1_Z_0_0100 == NEUTRON_STAR & ...
                        stellarType2_Z_0_0100 > 1 & ...
                        stellarType2_Z_0_0100 < 9);

massZAMS1_Z_0_0100 =h5read(filename_Z_0_0100,'/BSE_System_Parameters/Mass@ZAMS(1)');
massZAMS2_Z_0_0100 =h5read(filename_Z_0_0100,'/BSE_System_Parameters/Mass@ZAMS(2)');
totalMassZAMS_Z_0_0100 = sum(massZAMS1_Z_0_0100)+sum(massZAMS2_Z_0_0100);
realMass_Z_0_0100 = massEvolvedFactor*totalMassZAMS_Z_0_0100;

% Z=0.0142
filename_Z_0_0142 = strcat(dir,'Z_0_0142/COMPAS_Output_Z_0_0142.h5');
stellarType1_Z_0_0142 =h5read(filename_Z_0_0142,'/BSE_Common_Envelopes/Stellar_Type(1)');
stellarType2_Z_0_0142 =h5read(filename_Z_0_0142,'/BSE_Common_Envelopes/Stellar_Type(2)');
massCore2_Z_0_0142 =h5read(filename_Z_0_0142,'/BSE_Common_Envelopes/Core_Mass(2)');
indexOfInterest_Z_0_0142 = find(  stellarType1_Z_0_0142 == NEUTRON_STAR & ...
                        stellarType2_Z_0_0142 > 1 & ...
                        stellarType2_Z_0_0142 < 9);   
                    
massZAMS1_Z_0_0142 =h5read(filename_Z_0_0142,'/BSE_System_Parameters/Mass@ZAMS(1)');
massZAMS2_Z_0_0142 =h5read(filename_Z_0_0142,'/BSE_System_Parameters/Mass@ZAMS(2)');
totalMassZAMS_Z_0_0142 = sum(massZAMS1_Z_0_0142)+sum(massZAMS2_Z_0_0142);
realMass_Z_0_0142 = massEvolvedFactor*totalMassZAMS_Z_0_0142;

% Z=0.0200
filename_Z_0_0200 = strcat(dir,'Z_0_0200/COMPAS_Output_Z_0_0200.h5');
stellarType1_Z_0_0200 =h5read(filename_Z_0_0200,'/BSE_Common_Envelopes/Stellar_Type(1)');
stellarType2_Z_0_0200 =h5read(filename_Z_0_0200,'/BSE_Common_Envelopes/Stellar_Type(2)');
massCore2_Z_0_0200 =h5read(filename_Z_0_0200,'/BSE_Common_Envelopes/Core_Mass(2)');
indexOfInterest_Z_0_0200 = find(  stellarType1_Z_0_0200 == NEUTRON_STAR & ...
                        stellarType2_Z_0_0200 > 1 & ...
                        stellarType2_Z_0_0200 < 9);    
                    
massZAMS1_Z_0_0200 =h5read(filename_Z_0_0200,'/BSE_System_Parameters/Mass@ZAMS(1)');
massZAMS2_Z_0_0200 =h5read(filename_Z_0_0200,'/BSE_System_Parameters/Mass@ZAMS(2)');
totalMassZAMS_Z_0_0200 = sum(massZAMS1_Z_0_0200)+sum(massZAMS2_Z_0_0200);
realMass_Z_0_0200 = massEvolvedFactor*totalMassZAMS_Z_0_0200;

% Caclulate CDFs
[sortedCoreMass_Z_0_0001, weightedCDF_Z_0_0001] = createEmpiricalCDF(massCore2_Z_0_0001(indexOfInterest_Z_0_0001), ones(size(indexOfInterest_Z_0_0001)));
[sortedCoreMass_Z_0_0010, weightedCDF_Z_0_0010] = createEmpiricalCDF(massCore2_Z_0_0010(indexOfInterest_Z_0_0010), ones(size(indexOfInterest_Z_0_0010)));
[sortedCoreMass_Z_0_0100, weightedCDF_Z_0_0100] = createEmpiricalCDF(massCore2_Z_0_0100(indexOfInterest_Z_0_0100), ones(size(indexOfInterest_Z_0_0100)));
[sortedCoreMass_Z_0_0142, weightedCDF_Z_0_0142] = createEmpiricalCDF(massCore2_Z_0_0142(indexOfInterest_Z_0_0142), ones(size(indexOfInterest_Z_0_0142)));
[sortedCoreMass_Z_0_0200, weightedCDF_Z_0_0200] = createEmpiricalCDF(massCore2_Z_0_0200(indexOfInterest_Z_0_0200), ones(size(indexOfInterest_Z_0_0200)));

% Estimate yields
yield_Z_0_0001 = length(sortedCoreMass_Z_0_0001)/realMass_Z_0_0001;
yield_Z_0_0010 = length(sortedCoreMass_Z_0_0010)/realMass_Z_0_0010;
yield_Z_0_0100 = length(sortedCoreMass_Z_0_0100)/realMass_Z_0_0100;
yield_Z_0_0142 = length(sortedCoreMass_Z_0_0142)/realMass_Z_0_0142;
yield_Z_0_0200 = length(sortedCoreMass_Z_0_0200)/realMass_Z_0_0200;

if debugFlag
    yield_Z_0_0001
    yield_Z_0_0010
    yield_Z_0_0100
    yield_Z_0_0142
    yield_Z_0_0200
end

% Plot
if plotFlag==1
    fs=18;
    lw=2;

    stringX = '$\rm \textit{M}_{core}\ [M_{\odot}]$';
    stringY = '$\rm dN(<M_{\rm{core}})/dM_{total}\ [M_{\odot}^{-1}]$';
    stringY2 = '$\rm CDF$';

    pink0 = [0 0 0 ];
    pink1 = [    0.3333         0         0];
    pink2 = [    0.5443    0.2722    0.2722];
    pink3 = [    0.6939    0.3849    0.3849];
    pink4 = [    0.7454    0.5774    0.4714];
    pink5 = [    0.7935    0.7201    0.5443];

    clf
    hold on
    plot(sortedCoreMass_Z_0_0200,weightedCDF_Z_0_0200.*yield_Z_0_0200,'Linewidth',1.5,'Color',pink0)
    plot(sortedCoreMass_Z_0_0142,weightedCDF_Z_0_0142.*yield_Z_0_0142,'Linewidth',2,'Color',pink1)
    plot(sortedCoreMass_Z_0_0100,weightedCDF_Z_0_0100.*yield_Z_0_0100,'Linewidth',3,'Color',pink2)
    plot(sortedCoreMass_Z_0_0010,weightedCDF_Z_0_0010.*yield_Z_0_0010,'Linewidth',4,'Color',pink3)
    plot(sortedCoreMass_Z_0_0001,weightedCDF_Z_0_0001.*yield_Z_0_0001,'Linewidth',5,'Color',pink5)

    xline(10,'Linewidth',lw,'HandleVisibility','Off')

    text(1,0.7*10^-4,'\textbf{b}','Fontsize',fs,'Interpreter','latex')

    legend( 'Z=0.0200',...
            'Z=0.0142',...
            'Z=0.0100',...
            'Z=0.0010',...
            'Z=0.0001',...
            'FontSize',fs,...
            'Interpreter','Latex',...
            'FontName','Helvetica',...
            'Location','SouthEast',...
            'Box','off')
    xlabel(stringX,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ylabel(stringY,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ax=gca;
    ax.FontSize=fs;
    xlim([0 20])
    xticks([0:2:20])
    box on

    set(gca,'Fontsize',fs)
    box on
    hold off
    if savePlot
        print(gcf,'./Plots/COMPAS_yield.pdf','-dpdf');
    end

    figure()
    hold on
    plot(sortedCoreMass_Z_0_0200,weightedCDF_Z_0_0200,'Linewidth',1.5,'Color',pink0)
    plot(sortedCoreMass_Z_0_0142,weightedCDF_Z_0_0142,'Linewidth',2,'Color',pink1)
    plot(sortedCoreMass_Z_0_0100,weightedCDF_Z_0_0100,'Linewidth',3,'Color',pink2)
    plot(sortedCoreMass_Z_0_0010,weightedCDF_Z_0_0010,'Linewidth',4,'Color',pink3)
    plot(sortedCoreMass_Z_0_0001,weightedCDF_Z_0_0001,'Linewidth',5,'Color',pink5)

    xline(10,'Linewidth',lw,'HandleVisibility','Off')

    text(1,0.9,'\textbf{a}','Fontsize',fs,'Interpreter','latex')

    legend( 'Z=0.0200',...
            'Z=0.0142',...
            'Z=0.0100',...
            'Z=0.0010',...
            'Z=0.0001',...
            'FontSize',fs,...
            'Interpreter','Latex',...
            'FontName','Helvetica',...
            'Location','SouthEast',...
            'Box','off')

    xlabel(stringX,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ylabel(stringY2,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ax=gca;
    ax.FontSize=fs;
    xlim([0 20])
    xticks([0:2:20])
    box on

    set(gca,'Fontsize',fs)
    box on
    hold off
    if savePlot
        print(gcf,'./Plots/COMPAS_CDF.pdf','-dpdf');
    end
end

end