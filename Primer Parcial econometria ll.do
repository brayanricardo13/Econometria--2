* Primer parcial Econometria 2 
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ex9_2.dta"
* Crear la variable tiempo 
generate time = 1+_n-1
tsset time
/* Estimar un modelo de rezagos distribuidos finitos de orden 3 */
gen adv_1 = adv[_n-1]
gen adv_2 = adv[_n-2]
gen adv_3 = adv[_n-3] 

regress sales adv adv_1 adv_2 adv_3
*regresion simplificada 
regress sales l(0/3).adv
* correlograma 
predict ehat,residuals
ac ehat, lags(10)
*Prueba LM (breusch-godfrey LM test for autocorrelacion )
estat bgodfrey, lags(10)



