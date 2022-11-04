filename = 'RCPTable.xlsx';
sheet = 'Emissions';

x1Range = 'F159:F254';
rcp45 = xlsread(filename,sheet,x1Range);
x2Range = 'J159:J254';
rcp6 = xlsread(filename,sheet,x2Range);
x3Range = 'N159:N254';
rcp85 = xlsread(filename,sheet,x3Range);

time=linspace(2005,2100,2100-2004)

 plot(time,rcp85,'Color','#A2142F','Linewidth',1.5)
 hold on
 plot(time,rcp6,'Color','#EDB120','Linewidth',1.5)
 hold on
 plot(time,rcp45,'Color','#0072BD','Linewidth',1.5)
 xlim([2005 2100])