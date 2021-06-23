function app_MESA_plotRadius_b_normal
tic;

% Load Data
normal=importdata('../../../Data/MESA/radii_normal.dat');
mass_normal = normal.data(:,1);
metallicity_normal = normal.data(:,2);
ratio_normal = normal.data(:,5);

% Filter Data
unique(metallicity_normal)

index_Z_0_0100_normal = find(metallicity_normal==0.0100);
index_Z_0_0150_normal = find(metallicity_normal==0.0150);
index_Z_0_0200_normal = find(metallicity_normal==0.0200);
index_Z_0_0250_normal = find(metallicity_normal==0.0250);
index_Z_0_0300_normal = find(metallicity_normal==0.0300);
index_Z_0_0350_normal = find(metallicity_normal==0.0350);
index_Z_0_0400_normal = find(metallicity_normal==0.0400);


% Plot
fs=16;
lw=1.0;
sc0=2000;
sc=11;
greyColor=0.7.*[1 1 1];
alphaNum0=0.5;

string1='$\rm Helium\ star\ mass\ [M_{\odot}]$';
string2='$R_{\rm{final}}/R_{\rm{He-ZAMS}}$';

pink0 = [0 0 0];
pink1 = [    0.3333         0         0];
pink2 = [    0.5443    0.2722    0.2722];
pink3 = [    0.6939    0.3849    0.3849];
pink4 = [    0.7454    0.5774    0.4714];
pink5 = [    0.7935    0.7201    0.5443];
pink6 = [    0.8389    0.8389    0.6086];
pink7 = [    0.8819    0.8819    0.7265];
pink8 = [    0.9230    0.9230    0.8278];
pink9 = [    0.9623    0.9623    0.9179];
pink10 = [    1.0000    1.0000    1.0000];

clf
hold on
plot(mass_normal(index_Z_0_0300_normal),ratio_normal(index_Z_0_0300_normal),':','Linewidth',2.0*lw,'Color',pink5)
plot(mass_normal(index_Z_0_0250_normal),ratio_normal(index_Z_0_0250_normal),':','Linewidth',2.5*lw,'Color',pink4)
plot(mass_normal(index_Z_0_0200_normal),ratio_normal(index_Z_0_0200_normal),':','Linewidth',3.0*lw,'Color',pink3)
plot(mass_normal(index_Z_0_0150_normal),ratio_normal(index_Z_0_0150_normal),':','Linewidth',3.5*lw,'Color',pink1)
plot(mass_normal(index_Z_0_0100_normal),ratio_normal(index_Z_0_0100_normal),':','Linewidth',4.0*lw,'Color',pink0)

yline(1,'Linewidth',lw,'Handlevisibility','Off')

text(4.5,40,'\textbf{b}','Fontsize',fs,'Interpreter','latex')

legend( 'Z=0.030',...
        'Z=0.025',...
        'Z=0.020',...
        'Z=0.015',...
        'Z=0.010',...
        'Box','Off',...
        'Interpreter','latex')
set(gca,'YScale','log')
xlim([4, 14])
ylim([0.3, 60])

xlabel(string1,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ylabel(string2,'FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ax=gca;
ax.YTickLabels ={,'1','10'};
ax.FontSize=fs;
box on
print(gcf,'./Plots/MESA_radiusMetallicity_normal.pdf','-dpdf');
toc;
end