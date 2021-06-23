function app_GADGET_particleResolutionStudy
tic;

% Load Data
MNS_500K = importdata('../../data/MNS_500K.csv');
time_MNS_500K = MNS_500K(1,:);
mass_MNS_500K = MNS_500K(2,:);

MNS_1M = importdata('../../data/MNS_1M.csv');
time_MNS_1M = MNS_1M(1,:);
mass_MNS_1M = MNS_1M(2,:);

MNS_2M = importdata('../../data/MNS_2M.csv');
time_MNS_2M = MNS_2M(1,:);
mass_MNS_2M = MNS_2M(2,:);

MNS_5M = importdata('../../data/MNS_5M.csv');
time_MNS_5M = MNS_5M(1,:);
mass_MNS_5M = MNS_5M(2,:);

% Minor analysis
[val_500K,idx_500K] = min(abs((time_MNS_500K-1000.0)));
[val_1M,idx_1M] = min(abs((time_MNS_1M-1000.0)));
[val_2M,idx_2M] = min(abs((time_MNS_2M-1000.0)));
[val_5M,idx_5M] = min(abs((time_MNS_5M-1000.0)));

res_500K = mass_MNS_500K(1:idx_500K)-mass_MNS_5M(1:idx_5M);
res_1M = mass_MNS_1M(1:idx_1M)-mass_MNS_5M(1:idx_5M);
res_2M = mass_MNS_2M(1:idx_2M)-mass_MNS_5M(1:idx_5M);
res_5M = mass_MNS_5M(1:idx_5M)-mass_MNS_5M(1:idx_5M);

% Plots
sz=10;
fs=18;
lw=2.0;
alphaNum0=0.7;
alphaNum1=0.2;

stringY1 = '$M\ \rm [M_{\odot}]$';
stringY2 = '$M(t)-M_{5M}(t)\ \rm [M_{\odot}]$';
stringX = '$t\ \rm [s]$';

clf
hold on
plot(time_MNS_500K(1:idx_500K),mass_MNS_500K(1:idx_500K),'Linewidth',lw)
plot(time_MNS_1M(1:idx_1M),mass_MNS_1M(1:idx_1M),'Linewidth',lw)
plot(time_MNS_2M(1:idx_2M),mass_MNS_2M(1:idx_2M),'Linewidth',lw)
plot(time_MNS_5M(1:idx_5M),mass_MNS_5M(1:idx_5M),'Linewidth',lw)
ylabel(stringY1,'Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
legend( '$N_{\rm{p}}=5\times 10^5$',...
        '$N_{\rm{p}}=10^6$',...
        '$N_{\rm{p}}=2\times 10^6$',...
        '$N_{\rm{p}}=5\times 10^6$',...
        'Location','NorthWest',...
        'interpreter','latex',...
        'Box','Off')
set(gca,'Fontsize',fs)
set(gca,'XScale','log')
xlim([2 1000])
ylim([1.3 2.3])
yticks([1.3:0.1:2.3]);
% xlim([1 time_MNS_2M(end)])
box on
hold off
% print(gcf,'./Plots/resTest1.png','-dpng','-r400');
print(gcf,'./Plots/GADGET_resTest.pdf','-dpdf');

figure()
hold on
plot(time_MNS_500K(1:idx_500K),res_500K,'Linewidth',lw)
plot(time_MNS_1M(1:idx_1M),res_1M,'Linewidth',lw)
plot(time_MNS_2M(1:idx_2M),res_2M,'Linewidth',lw)
plot(time_MNS_5M(1:idx_5M),res_5M,'Linewidth',lw)
ylabel(stringY2,'Interpreter','Latex','FontSize',fs)
xlabel(stringX,'Interpreter','Latex','FontSize',fs)
legend('500K','1M','2M','5M',...
        'Location','NorthWest',...
        'Box','Off')
set(gca,'Fontsize',fs)
set(gca,'XScale','log')
% xlim([1 time_MNS_2M(end)])
xlim([2 1000])
box on
hold off
print(gcf,'./Plots/resTest2.png','-dpng','-r400');


toc;
end