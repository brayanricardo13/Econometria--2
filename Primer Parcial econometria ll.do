* Primer parcial Econometria 2 
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ex9_2.dta"
* Crear la variable tiempo 
tsset t
/* Estimar un modelo de rezagos distribuidos finitos de orden 3 */
regress d.sales adv l.adv l2.adv l3.adv 
* correlograma 
ac ehat, lags(10)
