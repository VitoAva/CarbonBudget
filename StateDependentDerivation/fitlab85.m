%% Loading the raw data RCP85
filename = 'greenonly85.xlsx';
sheet = 'Sheet1';

x1Range = 'B2:B83';
g2020 = xlsread(filename,sheet,x1Range);
x2Range = 'C2:C83';
g2043 = xlsread(filename,sheet,x2Range);
x3Range = 'D2:D83';
g2061 = xlsread(filename,sheet,x3Range);
x4Range = 'E2:E83';
g2075 = xlsread(filename,sheet,x4Range);
x5Range = 'F2:F83';
g2090 = xlsread(filename,sheet,x5Range);
x6Range = 'G2:G83';
g2100 = xlsread(filename,sheet,x6Range);


totaltime=linspace(0,length(g2020)-1,length(g2020));

% Write by hand from the table - associated F and T
F2020=614;
F2043=966;
F2061=1354;
F2075=1716;
F2090=2135;
F2100=2422;
T2020=0.98;
T2043=1.5;
T2061=2.03;
T2075=2.51;
T2090=3.03;
T2100=3.38;

Ca2020=408;
Ca2043=493;
Ca2061=595;
Ca2075=696;
Ca2090=819;
Ca2100=906;


%% Fitting the constants from the pulses; RC85


 c2020 =  polyfit(totaltime(72:82).',g2020(72:82),0);
 c2020plot=ones(72)*c2020;
%  plot(c2020plot)
%  hold on
%  plot(g2020)

 
c2043 =  polyfit(totaltime(72:82).',g2043(72:82),0);
c2043plot=ones(82)*c2043;
% plot(c2043plot)
% hold on
% plot(g2043)

c2061 =  polyfit(totaltime(72:82).',g2061(72:82),0);
c2061plot=ones(82)*c2061;
% plot(c2061plot)
% hold on
% plot(g2061)

c2075 =  polyfit(totaltime(72:82).',g2075(72:82),0);
c2075plot=ones(82)*c2075;
% plot(c2075plot)
% hold on
% plot(g2075)


 %% Fitting the TCRE; RCP85
F_rp85=[F2020,F2043,F2061,F2075];
T_rp85=[T2020,T2043,T2061,T2075];
C_rp85=[c2020,c2043,c2061,c2075];
Ca_rp85=[Ca2020,Ca2043,Ca2061,Ca2075];
%scatter(T_rp85,C_rp85)


%Fit F & T
% 
tcre_rp85=polyfit(F_rp85,C_rp85,1)
% Testing the linear function
   b0_rp85=tcre_rp85(2); b1_rp85=tcre_rp85(1);
   xlin= linspace(500,2000);
   ylin_rp85= b0_rp85+b1_rp85*xlin;
   plot(xlin,ylin_rp85,'Color','#A2142F','Linewidth',1.5)
   hold on
   scatter(F_rp85,C_rp85,'MarkerEdgeColor','#A2142F','Linewidth',1.5)
   xlim([500 2000])
% 
% tcre_rp85=polyfit(T_rp85,C_rp85,1)
% % Testing the linear function
%    b0_rp85=tcre_rp85(2); b1_rp85=tcre_rp85(1);
%    xlin= linspace(0.8,3); % Adapt if it is F or T
%    ylin_rp85= b0_rp85+b1_rp85*xlin;
%    plot(xlin,ylin_rp85,'Color','#A2142F','Linewidth',1.5)
%    hold on
%    scatter(T_rp85,C_rp85,'MarkerEdgeColor','#A2142F','Linewidth',1.5)
%    


%    tcre_rp85=polyfit(Ca_rp85,C_rp85,1)
% % Testing the linear function
%    b0_rp85=tcre_rp85(2); b1_rp85=tcre_rp85(1);
%    xlin= linspace(400,950); % Adapt if it is F or T
%    ylin_rp85= b0_rp85+b1_rp85*xlin;
%    plot(xlin,ylin_rp85,'Color','#A2142F','Linewidth',1.5)
%    hold on
%    scatter(Ca_rp85,C_rp85,'MarkerEdgeColor','#A2142F','Linewidth',1.5)
