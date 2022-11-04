%% Loading the raw data RCP6
filename = 'greenonly65.xlsx';
sheet = 'Sheet1';

x1Range = 'B2:B83';
g2020 = xlsread(filename,sheet,x1Range);
x2Range = 'C2:C83';
g2055 = xlsread(filename,sheet,x2Range);
x3Range = 'D2:D83';
g2078 = xlsread(filename,sheet,x3Range);
x4Range = 'E2:E83';
g2100 = xlsread(filename,sheet,x4Range);

totaltime=linspace(0,length(g2020)-1,length(g2020));

% Write by hand from the table - associated F and T
F2020=583.6;
F2055=959;
F2078=1317.508;
F2100=1656.6;
T2020=0.96;
T2055=1.51;
T2078=2.02;
T2100=2.5;

Ca2020=402;
Ca2055=486;
Ca2078=577;
Ca2100=660;

%% Fitting the constants from the pulses; RCP6


 c2020 =  polyfit(totaltime(72:82).',g2020(72:82),0);
 c2020plot=ones(82)*c2020;
%  plot(c2020plot)
%  hold on
%  plot(g2020)

 
c2055 =  polyfit(totaltime(72:82).',g2055(72:82),0);
c2055plot=ones(82)*c2055;
% plot(c2055plot)
% hold on
% plot(g2055)

c2078 =  polyfit(totaltime(72:82).',g2078(72:82),0);
c2078plot=ones(82)*c2078;
% plot(c2078plot)
% hold on
% plot(g2078)

c2100 =  polyfit(totaltime(72:82).',g2100(72:82),0);
c2100plot=ones(82)*c2100;
% plot(c2100plot)
% hold on
% plot(g2100)

%% Fitting the TCRE; RCP6
F_rp6=[F2020,F2055,F2078,F2100];
T_rp6=[T2020,T2055,T2078,T2100];
C_rp6=[c2020,c2055,c2078,c2100];
Ca_rp6=[Ca2020,Ca2055,Ca2078,Ca2100];
%scatter(T_rp6,C_rp6)
% 
tcre_rp6=polyfit(F_rp6,C_rp6,1)
   b0_rp6=tcre_rp6(2); b1_rp6=tcre_rp6(1);
   xlin= linspace(0.8,2.6); 
   xlin=linspace(500,2000);
   ylin_rp6= b0_rp6+b1_rp6*xlin;
   plot(xlin,ylin_rp6,'Color','#EDB120','Linewidth',1.5)
   hold on
   scatter(F_rp6,C_rp6,'MarkerEdgeColor','#EDB120','Linewidth',1.5)
%    
%    tcre_rp6=polyfit(T_rp6,C_rp6,1)
%    b0_rp6=tcre_rp6(2); b1_rp6=tcre_rp6(1);
%    xlin= linspace(0.8,3); % Adapt if it is F or T
%    ylin_rp6= b0_rp6+b1_rp6*xlin;
%    plot(xlin,ylin_rp6,'Color','#EDB120','Linewidth',1.5)
%    hold on
%    scatter(T_rp6,C_rp6,'MarkerEdgeColor','#EDB120','Linewidth',1.5)
%    xlim([xlin(1) xlin(100)])
   
%    tcre_rp6=polyfit(Ca_rp6,C_rp6,1)
% % Testing the linear function
%    b0_rp6=tcre_rp6(2); b1_rp6=tcre_rp6(1);
%    xlin= linspace(400,950); % Adapt if it is F or T
%    ylin_rp6= b0_rp6+b1_rp6*xlin;
%    plot(xlin,ylin_rp6,'Color','#EDB120','Linewidth',1.5)
%    hold on
%    scatter(Ca_rp6,C_rp6,'MarkerEdgeColor','#EDB120','Linewidth',1.5)
% 

   