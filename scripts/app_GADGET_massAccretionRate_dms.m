function app_GADGET_massAccretionRate_dms
tic;

M_0212_7 = importdata('Mdot_0212_7.csv');
M_0212_19 = importdata('Mdot_0212_19.csv');
M_0212_31 = importdata('Mdot_0212_31.csv');

% Plot
fs=16;
lw=2.0;
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

minValY = 1e-5;
maxValY = 0.1;

clf
hold on
plot(M_0212_7(1,:),M_0212_7(2,:),'Linewidth',lw,'Color',lines1)
plot(M_0212_19(1,:),M_0212_19(2,:),'Linewidth',lw,'Color',lines2)
plot(M_0212_31(1,:),M_0212_31(2,:),'Linewidth',lw,'Color',lines3)

text(6,0.06,'\textbf{b}','Fontsize',fs,'Interpreter','latex')
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
legend( '$\mathrm{d} m=0.6$',...
        '$\mathrm{d} m=0.7$',...
        '$\mathrm{d} m=0.8$',...
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

print(gcf,'./Plots/GADGET_massAccretionRate_dms.pdf','-dpdf');



toc;
end