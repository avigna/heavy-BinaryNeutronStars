function figure2_massAccretionRate_b_and_c(dir,plotFlag,saveFlag,debugFlag)
%
% dir: specify directory path as '/DIR/TO/SPECIFY/' or [] for empty dir.
% plotFlag: if true, plots; else, not.
% saveFlag: if true, saves; else, not. Only used if plotFlag is true.
% debugFlag: if true, prints values to terminal; else, not.

% Specify where is the output 
if exist(dir)~=1
    dir = '../../../Data/COMPAS/v02.19.01/10M/';
end

if plotFlag~=1
    plotFlag = 0;
end

if saveFlag~=1
    saveFlag = 0;
end

if debugFlag~=1
    debugFlag = 0;
end

if debugFlag
    dir
    plotFlag
    saveFlag
    debugFlag
end

% Load data
M_0212_19 = importdata('../../../Data/Zenodo/GADGET/Mdot_0212_19.csv');
time_0212_19 = M_0212_19(1,:);
Mdot_0212_19 = M_0212_19(2,:);

MNS_0212_19 = importdata('../../../Data/Zenodo/GADGET/MNS_0212_19.csv');
time_MNS_0212_19 = MNS_0212_19(1,:);
mass_MNS_0212_19 = MNS_0212_19(2,:);

% Plot
if plotFlag
    fs=16;
    lw=2.0;

    color1 = [         0    0.4470    0.7410];
    color2 = [    0.8500    0.3250    0.0980];

    string1='$\rm t\ [s]$';
    string2='$\dot{M}\ \rm[M_{\odot}\ s^{-1}]$';
    string3='$M_{\rm{final}}\ \rm[M_{\odot}]$';

    minValY = 1e-5;
    maxValY = 0.1;

    clf
    subplot(2,1,1)
    hold on
    plot(time_0212_19,Mdot_0212_19,'Linewidth',lw,'Color',color1)
    xline(8,'Linewidth',lw)
    xline(100,'Linewidth',lw)
    xline(1004,'Linewidth',lw)
    set(gca,'XScale','log')
    set(gca,'YScale','log')
    ylabel(string2,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    xlim([5, 2000])
    set(gca,'XTickLabels',[])
    ylim([minValY, maxValY])
    ax=gca;
    ax.FontSize=fs;
    box on

    subplot(2,1,2)
    plot(time_MNS_0212_19,mass_MNS_0212_19,'Linewidth',lw,'Color',color2)
    xline(8,'Linewidth',lw)
    xline(100,'Linewidth',lw)
    xline(1004,'Linewidth',lw)
    set(gca,'XScale','log')
    xlim([5, 2000])
    set(gca,'XTickLabels',[{'10','100','1000'}])
    ylim([1.3 2.3])
    xlabel(string1,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ylabel(string3,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

    ax=gca;
    ax.FontSize=fs;
    box on

    if saveFlag
        print(gcf,'./Plots/figure2_massAccretionRate.pdf','-dpdf');
    end
end

end