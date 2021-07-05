use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\okun.dta"

generate t=1+_n-1
tsset t 
*Prueba de raiz unitaria para g.
tsline g
dfuller g
*g es I(0)

*Prueba de raiz unitaria para u.
tsline u
dfuller u
*probamos con la primera diferencia
tsline d.u
dfuller d.u, noconstant lags(0)

*VAR(1)
varbasic g d.u, lags(1/1) step(8) nograph
vargranger
varbasic g d.u, irf

