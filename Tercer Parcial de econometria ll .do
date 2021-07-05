* Tercer Parcial de econometria ll 
*25/05/2021
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\fred.dta"
 
*b)Grafique las dos series y explique su comportamiento. ¿Nota alguna relación en el comportamiento de las dos series? 

*Crear la variable de tiempo 
generate t=1+_n-1
tsset t 

tsline c
tsline y

tsline c y
*Primeras diferencias 
tsline d.c d.y 
correlate d.c d.y
//////////////////////////////////////////////////////////////////////////////
*c) Determine el orden de integración de las dos series. Determine también si las dos variables están cointegradas. Explique claramente.
 
*prueba de raiz unitaria con intercepto
dfuller c, lags(0)
dfuller y, lags(0)


*creamos las variables en primera diferencia
gen db=d.b
gen df=d.f
//////////////////////////////////////////////////////////////////////////////
* d) Teniendo en cuenta el resultado del Realice un modelo VAR(1), presente las ecuaciones estimadas. Realice también la prueba de causalidad de Granger. Interprete los resultados en este caso.


regress c l.y l.c
regress y l.y l.c
*Estimacion bajo el comando de STATA
varbasic l.y l.c, lags(1/1) step(10)
*Test de causalidad de Granger
vargranger




*e) Utilizando los resultados del punto d) realice un análisis de impulso respuesta de 10 periodos si sobre el consumo cae un shock igual a una desviación estándar. Realice los gráficos resultantes, preséntelos y analícelos.



*f) Utilizando los resultados del punto d) realice un análisis de impulso respuesta de 10 periodos si sobre el ingreso cae un shock igual a una desviación estándar. Realice los gráficos resultantes, preséntelos y analícelos.










