function figure3_explosionEnergyVsFinalMass(dir,plotFlag,saveFlag,debugFlag)
%
% dir: specify directory path as '/DIR/TO/SPECIFY/' or [] for empty dir.
% plotFlag: if true, plots; else, not.
% savePlot: if true, saves; else, not. Only used if plotFlag is true.
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

% Data
finalMass_m_0_6 = [5.31021
5.14555
4.8742
4.58553
4.0793
2.99371
2.27238
1.99136
1.79385
1.59783
1.48066
1.39757];

finalMass_m_0_7 = [5.32925
5.14803
4.76096
4.40468
3.83113
2.73325
2.13387
1.92098
1.73689
1.54338
1.4267
1.36085];

finalMass_m_0_8 = [5.31992
5.10669
4.6713
4.14241
3.53299
2.50759
2.07921
1.88539
1.70137
1.49618
1.3954
1.35459];

explosionFactors = [ 0.5000
0.7000
0.9000
1.0000
1.1000
1.3000
1.5000
1.7000
2.0000
2.5000
3.0000
4.0000];
            
Minitial = 5.44665;
finalMass_m_0_7_line  = [Minitial; finalMass_m_0_7];
explosionFactors_line = [0.0; explosionFactors];
%
minMass = zeros(size(finalMass_m_0_8));
maxMass = zeros(size(finalMass_m_0_8));

for i=1:9
    minMass(i)=min(finalMass_m_0_6(i),min(finalMass_m_0_7(i),finalMass_m_0_8(i)));
    maxMass(i)=max(finalMass_m_0_6(i),max(finalMass_m_0_7(i),finalMass_m_0_8(i)));
end

% Plot
if plotFlag
    fs=16;
    lw=2.5;
    sc=11;
    alphaNum0=0.5;
    string1='$E_{\rm{exp}}\ \rm[bethe]$';
    string2='$M_{\rm{final}}\ \rm[M_{\odot}]$';

    N=10;
    xAll = linspace(0.0,5.0,N);
    GW170817 = repmat([1.17;1.36],1,N);
    GW190425 = repmat([1.6;2.7],1,N);
    MTOV = repmat([1.97;2.33],1,N);     % https://arxiv.org/pdf/1711.00314.pdf

%     xFryer = linspace(0.0,1.2,N);
%     delayedFryerBaryonic = repmat([2.33;2.9],1,N);
%     delayedFryerGravitational = repmat([2.02;2.45],1,N);
% 
%     gravitationalMuller = 1.41
%     baryonicMuller = gravitationalMuller+(0.084*gravitationalMuller*gravitationalMuller)

    color1 = [         0    0.4470    0.7410];
    pink1 = [     0.3333         0         0];
    pink6 = [     0.8389    0.8389    0.6086];
    
    Minitial = 5.44665;
    MfinalUnbound = (Minitial-1.3)/2
    Minitial-MfinalUnbound

    clf
    hold on

    h0=fill([xAll flip(xAll)],[GW170817(1,:) flip(GW170817(2,:))],pink1,'EdgeColor','none');
    set(h0,'FaceAlpha',alphaNum0)% if size(y0,1)==2 %plot shaded area       
    h1=fill([xAll flip(xAll)],[GW190425(1,:) flip(GW190425(2,:))],pink6,'EdgeColor','none');
    set(h1,'FaceAlpha',alphaNum0)% if size(y0,1)==2 %plot shaded area       

    h2=fill([xAll flip(xAll)],[MTOV(1,:) flip(MTOV(2,:))],'k','EdgeColor','none');
    set(h2,'FaceAlpha',alphaNum0)% if size(y0,1)==2 %plot shaded area

    plot(explosionFactors_line,finalMass_m_0_7_line,'k','Linewidth',lw,'HandleVisibility','Off')

    yneg = (finalMass_m_0_7-finalMass_m_0_8);
    ypos = (finalMass_m_0_6-finalMass_m_0_7);
    errorbar(explosionFactors,finalMass_m_0_7,yneg,ypos,'dk','MarkerSize',sc,'MarkerFaceColor','k','HandleVisibility','Off')

    yline(1.3,'--','Linewidth',lw)
    yline(MfinalUnbound,'-.','Linewidth',lw)
    xline(0.9,'-','Linewidth',lw,'Color',color1)
    xline(1.2,'--','Linewidth',lw,'Color',color1)
    xline(1.72,':','Linewidth',lw,'Color',color1)

    annotation('arrow',[.36 .33],0.84.*[1.0 1.0],'Linewidth',lw,'Color',color1)
    annotation('arrow',[.36+0.1 .33+0.1],0.84.*[1.0 1.0],'Linewidth',lw,'Color',color1)

    legend( 'GW170817',...
            'GW190425',...
            '$M_{\rm{TOV}}$',...
            '$M_{\rm{proto-NS}}$',...
            '$M_{\rm{unbound}}$',...
            'M\"uller+2016',...
            'Fryer Delayed',...                
            'Ertl+2020',...
            'Interpreter','Latex',...
            'Location','NorthEast',...
            'Box','Off',...
            'FontSize',fs)

    xlim([0 4])
    xlabel(string1,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ylabel(string2,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
    ax=gca;
    ax.FontSize=fs;
    box on

    if saveFlag
        print(gcf,'./Plots/figure3_explosionEnergyVsFinalMass.pdf','-dpdf');
    end
end

end