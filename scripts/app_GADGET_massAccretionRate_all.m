function app_GADGET_massAccretionRate_all
tic;

M_0212_13 = importdata('Mdot_0212_13.csv');
M_0212_14 = importdata('Mdot_0212_14.csv');
M_0212_15 = importdata('Mdot_0212_15.csv');
M_0212_16 = importdata('Mdot_0212_16.csv');
M_0212_17 = importdata('Mdot_0212_17.csv');
M_0212_18 = importdata('Mdot_0212_18.csv');
M_0212_19 = importdata('Mdot_0212_19.csv');
M_0212_20 = importdata('Mdot_0212_20.csv');
M_0212_21 = importdata('Mdot_0212_21.csv');
M_0212_22 = importdata('Mdot_0212_22.csv');
M_0212_23 = importdata('Mdot_0212_23.csv');
M_0212_24 = importdata('Mdot_0212_24.csv');

% Plot
fs=16;
lw=1.0;
sc0=2000;
sc=11;
greyColor=0.7.*[1 1 1];
alphaNum0=0.5;

lines1 = [         0    0.4470    0.7410];
lines2 = [    0.8500    0.3250    0.0980];
lines3 = [    0.9290    0.6940    0.1250];
lines4 = [    0.4940    0.1840    0.5560];
lines5 = [    0.4660    0.6740    0.1880];
lines6 = [    0.3010    0.7450    0.9330];
lines7 = [    0.6350    0.0780    0.1840];

string1='$\rm t\ [s]$';
string2='$\dot{M}\ \rm[M_{\odot}\ s^{-1}]$';

minValY = 2e-5;
maxValY = 1.0;

clf
hold on
plot(M_0212_13(1,:),M_0212_13(2,:),'Linewidth',lw,'Color',lines7)
plot(M_0212_14(1,:),M_0212_14(2,:),'Linewidth',lw,'Color',lines6)
plot(M_0212_15(1,:),M_0212_15(2,:),'Linewidth',lw,'Color',lines5)
plot(M_0212_16(1,:),M_0212_16(2,:),'Linewidth',lw,'Color',lines4)
plot(M_0212_17(1,:),M_0212_17(2,:),'Linewidth',lw,'Color',lines3)
plot(M_0212_18(1,:),M_0212_18(2,:),'Linewidth',lw,'Color',lines2)
plot(M_0212_19(1,:),M_0212_19(2,:),'Linewidth',3.0,'Color',lines1)
plot(M_0212_20(1,:),M_0212_20(2,:),'--','Linewidth',lw,'Color',lines2)
plot(M_0212_21(1,:),M_0212_21(2,:),'--','Linewidth',lw,'Color',lines3)
plot(M_0212_22(1,:),M_0212_22(2,:),'--','Linewidth',lw,'Color',lines4)
plot(M_0212_23(1,:),M_0212_23(2,:),'--','Linewidth',lw,'Color',lines5)
plot(M_0212_24(1,:),M_0212_24(2,:),'--','Linewidth',lw,'Color',lines6)

text(6,0.6,'\textbf{a}','Fontsize',fs,'Interpreter','latex')

% explosionFactors = [ 0.5000
% 0.7000
% 0.9000
% 1.0000
% 1.1000
% 1.3000
% 1.5000
% 1.7000
% 2.0000
% 2.5000
% 3.0000
% 4.0000];
%             
legend( '$E_{51}=0.5$',...
        '$E_{51}=0.7$',...
        '$E_{51}=0.9$',...        
        '$E_{51}=1.0$',...
        '$E_{51}=1.1$',...
        '$E_{51}=1.3$',...
        '$E_{51}=1.5$',...
        '$E_{51}=1.7$',...
        '$E_{51}=2.0$',...
        '$E_{51}=2.5$',...
        '$E_{51}=3.0$',...
        '$E_{51}=4.0$',...
        'interpreter','latex',...
        'Location','NorthEast')

xline(10,'Linewidth',lw,'Handlevisibility','off')
xline(100,'Linewidth',lw,'Handlevisibility','off')
xline(1000,'Linewidth',lw,'Handlevisibility','off')
set(gca,'XScale','log')
set(gca,'YScale','log')

xlim([5, 2000])
ylim([minValY, maxValY])
set(gca,'XTickLabels',[{'10','100','1000'}])

xlabel(string1,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ylabel(string2,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ax=gca;
ax.FontSize=fs;
box on
% grid on

print(gcf,'./Plots/GADGET_massAccretionRate_all.pdf','-dpdf');



toc;
end