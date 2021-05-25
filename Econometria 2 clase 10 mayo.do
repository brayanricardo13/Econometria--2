
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\usa.dta"

*Modelo VAR(1)
generate t=1+_n-1
tsset t 

*Estimar la primera ecuación
regress d.gdp l.d.inf l.d.gdp
*Estimar la segunda ecuación
regress d.inf l.d.inf l.d.gdp
*Estimacion bajo el comando de STATA
varbasic d.gdp d.inf, lags(1/1) step(8)
*Test de causalidad de Granger
vargranger

*VAR(2)
varbasic d.gdp d.inf, lags(1/2) step(8)
vargranger
