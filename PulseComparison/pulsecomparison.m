filename = 'Tabela_CO2GreenRCP6.xlsx';
sheet = 'Greens Together';

xlRange = 'B2:B83';
g2020 = xlsread(filename,sheet,xlRange)
x2Range = 'C2:C83';
g2055 = xlsread(filename,sheet,x2Range)
x3Range = 'D2:D83';
g2078 = xlsread(filename,sheet,x3Range)
x4Range = 'E2:E83';
g2100 = xlsread(filename,sheet,x4Range)

hside=linspace(1.53e-3,1.53e-3,82)
plot(g2020,'Linewidth',1.5)
xlim([0 80])
grid on
hold on
plot(g2055,'Linewidth',1.5)
hold on
plot(g2078,'Linewidth',1.5)
hold on
plot(g2100,'Linewidth',1.5)
hold on
plot(hside,'-.','Color','k','Linewidth',2)