
Sets
t "time steps" /t1850*t2177/

i
/i1*i4/

j
/ j1*j3/
;



Scalars
r0
r_u
r_T
r_a
ppm_gtc
f1
f3
zeit                                   /1/
g0
g1
c0
;

r0 = 33.9 ;
r_u = 0.0188 ;
r_T = 2.67 ;
r_a = 0;
c0=280;
f1     = 4.57 ;
f3 =     0.086 ;
ppm_gtc = 2.12  ;

$include "GreenGenConcEmission2078.inc";


Parameters

a(i)
/
i1   0.217
i2   0.224
i3   0.282
i4   0.276
/

teta(i)
/
i1   1000000000.0
i2   394
i3   36.5
i4   4.3
/

q(j)
/
j1   0.180
j2   0.297
j3   0.386
/

d(j)
/
j1  0.903
j2   7.92
j3   355
/
;

g1 = sum(i, a(i)*teta(i)*(1-(1+100/teta(i))*exp(-100/teta(i))));
g0 = exp((-1/g1)*sum(i, a(i)*teta(i)*(1- exp(-100/teta(i))) ));

Positive variables
Temp_ohne(t)
Co2Conc_ohne(t)
FCO2_ohne(t)
alpha_ohne(t)

Temp_with(t)
Co2Conc_with(t)
FCO2_with(t)
alpha_with(t)
;

Variables
G_u_ohne(t)
Temp3_ohne(j,t)
G_a_ohne(t)
R_ohne(i,t)
Ftot_ohne(t)
F_ohne(t)

G_u_with(t)
Temp3_with(j,t)
G_a_with(t)
R_with(i,t)
Ftot_with(t)
F_with(t)

Green(t)
Xariable
;

Equations
Eq1_ohne(i,t)
Eq2_ohne(t)
Eq3_ohne(t)
Eq4_ohne(t)
Eq5_ohne(t)
Eq6_ohne(t)
Eq7_ohne(t)
Eq8_ohne(j,t)
Eq9_ohne(t)
Cum_Eq_ohne(t)

Eq1_with(i,t)
Eq2_with(t)
Eq3_with(t)
Eq4_with(t)
Eq5_with(t)
Eq6_with(t)
Eq7_with(t)
Eq8_with(j,t)
Eq9_with(t)
Cum_Eq_with(t)

GreenEq(t)
Eq007
;


Eq1_ohne(i,t+1)..
   R_ohne(i,t+1) =e=  a(i) * alpha_ohne(t)* teta(i) * (E_ohne(t)/ ppm_gtc) * (1-exp(-zeit/(alpha_ohne(t)* teta(i))))
                       + R_ohne(i,t) * exp(-zeit/(alpha_ohne(t)* teta(i)) ) ;
Eq2_ohne(t+1)..
   Co2Conc_ohne(t+1) =e= c0 +  sum(i, R_ohne(i,t+1));
Eq3_ohne(t)..
    alpha_ohne(t) =e= g0 * exp(  (r0 + r_u * G_u_ohne(t) + r_T * Temp_ohne(t) + r_a * G_a_ohne(t))/g1) ;
Eq4_ohne(t)..
   G_a_ohne(t) =e= sum(i, R_ohne(i,t)) *  ppm_gtc ;
Cum_Eq_ohne(t)..
    F_ohne(t) =e= F_ohne(t-1)+E_ohne(t-1);
Eq5_ohne(t)..
   G_u_ohne(t) =e= F_ohne(t) - G_a_ohne(t) ;
Eq6_ohne(t)..
   Ftot_ohne(t) =e= FCO2_ohne(t);
Eq7_ohne(t)..
    FCO2_ohne(t) =e= f1*log((Co2Conc_ohne(t)+0.001)/c0) + f3*(sqrt(Co2Conc_ohne(t)) - sqrt(c0)) ;
Eq8_ohne(j,t+1)..
   Temp3_ohne(j,t+1) =e= Temp3_ohne(j,t) * exp(-zeit/d(j))  + q(j)*Ftot_ohne(t+1) * (1- exp(-zeit/d(j))) ;
Eq9_ohne(t+1)..
   Temp_ohne(t+1) =e= sum(j,Temp3_ohne(j,t+1));

Eq1_with(i,t+1)..
   R_with(i,t+1) =e=  a(i) * alpha_with(t)* teta(i) * (E_with(t)/ ppm_gtc) * (1-exp(-zeit/(alpha_with(t)* teta(i))))
                       + R_with(i,t) * exp(-zeit/(alpha_with(t)* teta(i)) ) ;
Eq2_with(t+1)..
   Co2Conc_with(t+1) =e= c0 +  sum(i, R_with(i,t+1));
Eq3_with(t)..
    alpha_with(t) =e= g0 * exp(  (r0 + r_u * G_u_with(t) + r_T * Temp_with(t) + r_a * G_a_with(t))/g1) ;
Eq4_with(t)..
   G_a_with(t) =e= sum(i, R_with(i,t)) *  ppm_gtc ;
Cum_Eq_with(t)..
    F_with(t) =e= F_with(t-1)+E_with(t-1);
Eq5_with(t)..
   G_u_with(t) =e= F_with(t) - G_a_with(t) ;
Eq6_with(t)..
   Ftot_with(t) =e= FCO2_with(t);
Eq7_with(t)..
    FCO2_with(t) =e= f1*log((Co2Conc_with(t)+0.001)/c0) + f3*(sqrt(Co2Conc_with(t)) - sqrt(c0)) ;
Eq8_with(j,t+1)..
   Temp3_with(j,t+1) =e= Temp3_with(j,t) * exp(-zeit/d(j))  + q(j)*Ftot_with(t+1) * (1- exp(-zeit/d(j))) ;
Eq9_with(t+1)..
   Temp_with(t+1) =e= sum(j,Temp3_with(j,t+1));

GreenEq(t)..
    Green(t) =e= Temp_with(t)-Temp_ohne(t);

Eq007..
    Xariable =e= 42;

alpha_ohne.lo(t)  = 0.1 ;
alpha_with.lo(t) =0.1;


*               *******CALIBRATION*******

*$ontext
R_with.fx("i1","t1850") = 0 ;
R_with.fx("i2","t1850") = 0  ;
R_with.fx("i3","t1850") = 0  ;
R_with.fx("i4","t1850") = 0  ;
*$offtext

R_ohne.fx("i1","t1850") = 0 ;
R_ohne.fx("i2","t1850") = 0  ;
R_ohne.fx("i3","t1850") = 0  ;
R_ohne.fx("i4","t1850") = 0  ;

Co2Conc_with.fx("t1850") = c0 +  sum(i, R_with.l(i,"t1850"))   ;
Co2Conc_ohne.fx("t1850") = c0 +  sum(i, R_ohne.l(i,"t1850"))   ;

Temp3_with.fx("j1","t1850") = 0  ;
Temp3_with.fx("j2","t1850") = 0  ;
Temp3_with.fx("j3","t1850") = 0  ;

Temp3_ohne.fx("j1","t1850") = 0  ;
Temp3_ohne.fx("j2","t1850") = 0  ;
Temp3_ohne.fx("j3","t1850") = 0  ;

Temp_ohne.fx("t1850") = Temp3_ohne.l("j1","t1850") + Temp3_ohne.l("j2","t1850") + Temp3_ohne.l("j3","t1850")  ;
Temp_with.fx("t1850") = Temp3_with.l("j1","t1850") + Temp3_with.l("j2","t1850") + Temp3_with.l("j3","t1850") ;


G_a_ohne.l("t1850") =  sum(i, R_ohne.l(i,"t1850")) *  ppm_gtc;
G_u_ohne.l("t1850") =  0 ;
FCO2_ohne.l("t1850") = f1*log((Co2Conc_ohne.l("t1850")+0.001)/c0) + f3*(sqrt(Co2Conc_ohne.l("t1850")) - sqrt(c0)) ;
Ftot_ohne.l("t1850") = FCO2_ohne.l("t1850") ;

G_a_with.l("t1850") =  sum(i, R_with.l(i,"t1850")) *  ppm_gtc;
G_u_with.l("t1850") =  0 ;
FCO2_with.l("t1850") = f1*log((Co2Conc_with.l("t1850")+0.001)/c0) + f3*(sqrt(Co2Conc_with.l("t1850")) - sqrt(c0)) ;
Ftot_with.l("t1850") = FCO2_with.l("t1850") ;



*============================   End Of File   ================================

model unfair /all/

option nlp = conopt3;
solve unfair maximizing xariable using nlp ;
