 *clase 17/02/2021
use "C:\Users\jhona\Downloads\okun.dta"
*creamos la variable en el tiempo 
generate t=tq(1985,2)+_n+1
tsset t, q
tsline g

*Modelo RD(3):
regress d.u l(0/3).g

*Obtenemos los residuales 
predict ehat,residuals
*correlograma
 ac ehat, lags(15)