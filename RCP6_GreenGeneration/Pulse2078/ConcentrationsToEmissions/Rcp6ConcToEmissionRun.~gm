
Sets
t "time steps" /t1850*t2178/

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

$include "ConcentrationInput.inc";

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
Temp(t)
E(t)
FCO2(t)
alpha(t)
;

Variables
G_u(t)
Temp3(j,t)
G_a(t)
R(i,t)
Ftot(t)
F(t)
Xariable
;

Equations
Eq1(i,t)
Eq2(t)
Eq3(t)
Eq4(t)
Eq5(t)
Eq6(t)
Eq7(t)
Eq8(j,t)
Eq9(t)
Cum_Eq(t)
Eq007
;

Eq1(i,t+1)..
   R(i,t+1) =e=  a(i) * alpha(t)* teta(i) * (E(t)/ ppm_gtc) * (1-exp(-zeit/(alpha(t)* teta(i))))
                       + R(i,t) * exp(-zeit/(alpha(t)* teta(i)) ) ;

Eq2(t+1)..
   Co2Conc(t+1) =e= c0 +  sum(i, R(i,t+1));

Eq3(t)..
    alpha(t) =e= g0 * exp(  (r0 + r_u * G_u(t) + r_T * Temp(t) + r_a * G_a(t))/g1) ;

Eq4(t)..
   G_a(t) =e= sum(i, R(i,t)) *  ppm_gtc ;

Cum_Eq(t)..
    F(t) =e= F(t-1)+E(t-1);

Eq5(t)..
   G_u(t) =e= F(t) - G_a(t) ;

Eq6(t)..
   Ftot(t) =e= FCO2(t)
 ;

Eq7(t)..
   FCO2(t) =e= f1*log((Co2Conc(t)+0.001)/c0) + f3*(sqrt(Co2Conc(t)) - sqrt(c0)) ;

Eq8(j,t+1)..
   Temp3(j,t+1) =e= Temp3(j,t) * exp(-zeit/d(j))  + q(j)*Ftot(t+1) * (1- exp(-zeit/d(j))) ;

Eq9(t+1)..
   Temp(t+1) =e= sum(j,Temp3(j,t+1));

Eq007..
    Xariable =e= 42;


*******CALIBRATION*******

*$ontext
R.fx("i1","t1850") = 0 ;
R.fx("i2","t1850") = 0  ;
R.fx("i3","t1850") = 0  ;
R.fx("i4","t1850") = 0  ;
*$offtext



alpha.lo(t)  = 0.1 ;


G_a.l("t1850") =  sum(i, R.l(i,"t1850")) *  ppm_gtc;

G_u.l("t1850") =  0 ;


FCO2.l("t1850") = f1 * log((CO2Conc("t1850")+0.001)/c0) + f3*(sqrt(Co2Conc("t1850"))-sqrt(c0));
Ftot.l("t1850") = FCO2.l("t1850") ;

Temp3.fx("j1","t1850") = 0  ;
Temp3.fx("j2","t1850") = 0  ;
Temp3.fx("j3","t1850") = 0  ;



Temp.fx("t1850") = Temp3.l("j1","t1850") + Temp3.l("j2","t1850") + Temp3.l("j3","t1850")  ;

alpha.l("t1850") = g0 * exp((r0 + r_u * G_u.l("t1850") + r_T * Temp.l("t1850") + r_a * G_a.l("t1850") )/g1) ;



*============================   End Of File   ================================

model unfair /all/

option nlp = conopt3;
solve unfair maximizing xariable using nlp ;
