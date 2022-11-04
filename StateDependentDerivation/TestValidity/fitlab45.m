filename = 'Tabela_CO2GreenRCP45.xlsx';
sheet = 'The Run';


%gledamo od 2021!
F0=598.589563573
x1Range = 'E176:E255';
Em = xlsread(filename,sheet,x1Range);
F=zeros(1,length(Em))+F0;
x2Range= 'O176:O255';
TFair = xlsread(filename,sheet,x2Range);

for i=2:length(Em)
    F(i)=F(i-1)+Em(i-1)
end

T0=0.96171;
A=0.0001083;
B=0.0016460;

for i=1:length(F)
    Tstate(i)=B/A+(T0-B/A)*exp(-A*(F(i)-F0));
    Tconst(i)=0.00000163*1000*F(i);
    Tconst2(i)=0.00000153*1000*F(i);
end

years=linspace(2021,2100,2100-2020);

plot(years,TFair,'Color','Blue','Linewidth',1.5)
hold on;
plot(years,Tstate','Color','Red','Linewidth',1.5)
hold on;
plot(years,Tconst',':','Color','#EDB120','Linewidth',1.5)
hold on;
plot(years,Tconst2','--','Color','#EDB120','Linewidth',1.5)