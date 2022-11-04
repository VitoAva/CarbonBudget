%% Loading the raw data RCP85
filename = 'greenonly45.xlsx';
sheet = 'Sheet1';

x1Range = 'B2:B83';
g2020 = xlsread(filename,sheet,x1Range);
x2Range = 'C2:C83';
g2051 = xlsread(filename,sheet,x2Range);
x3Range = 'D2:D83';
g2100 = xlsread(filename,sheet,x3Range);




totaltime=linspace(0,length(g2020)-1,length(g2020));

% Write by hand from the table - associated F and T
F2020=614;
F2051=944;
F2100=1259;
T2020=0.96;
T2051=1.5;
T2100=1.94;
Ca2020=404;
Ca2051=482;
Ca2100=529;


%% Fitting the constants from the pulses; RC85


 c2020 =  polyfit(totaltime(72:82).',g2020(72:82),0)
 c2020plot=ones(82)*c2020;
%  plot(c2020plot)
%  hold on
%  plot(g2020)

 
c2051 =  polyfit(totaltime(72:82).',g2051(72:82),0);
c2051plot=ones(82)*c2051;
% plot(c2051plot)
% hold on
% plot(g2051)

c2100 =  polyfit(totaltime(72:82).',g2100(72:82),0);
c2100plot=ones(82)*c2100;
% plot(c2100plot)
% hold on
% plot(g2100)

%%

% %% Fitting the TCRE; RCP85
F_rp45=[F2020,F2051,F2100];
T_rp45=[T2020,T2051,T2100];
C_rp45=[c2020,c2051,c2100]
Ca_rp45=[Ca2020,Ca2051,Ca2100];
%scatter(T_rp45,C_rp45)


%Fit F & T

tcre_rp45=polyfit(F_rp45(1:3),C_rp45(1:3),1)
   b0_rp45=tcre_rp45(2); b1_rp45=tcre_rp45(1);
   xlin= linspace(500,2000);
   ylin_rp45= b0_rp45+b1_rp45*xlin;
   plot(xlin,ylin_rp45,'Color','#0072BD','Linewidth',1.5)
   hold on
   scatter(F_rp45,C_rp45,'MarkerEdgeColor','#0072BD','Linewidth',1.5)

% tcre_rp45=polyfit(T_rp45,C_rp45,1)
%    b0_rp45=tcre_rp45(2); b1_rp45=tcre_rp45(1);
%    xlin= linspace(0.8,3); % Adapt if it is F or T
%    ylin_rp45= b0_rp45+b1_rp45*xlin;
%     plot(xlin,ylin_rp45,'Color','#0072BD','Linewidth',1.5)
%    hold on
%    scatter(T_rp45,C_rp45,'MarkerEdgeColor','#0072BD','Linewidth',1.5)
   
%  tcre_rp45=polyfit(Ca_rp45,C_rp45,1)
% % Testing the linear function
%    b0_rp45=tcre_rp45(2); b1_rp45=tcre_rp45(1);
%    xlin= linspace(400,950); % Adapt if it is F or T
%    ylin_rp45= b0_rp45+b1_rp45*xlin;
%    plot(xlin,ylin_rp45,'Color','#0072BD','Linewidth',1.5)
%    hold on
%    scatter(Ca_rp45,C_rp45,'MarkerEdgeColor','#0072BD','Linewidth',1.5)

