*Multiplicador de Lagrange
generate t=1+_n-1
tsset t

/*Supongamos un modelo que explica el cambio en el desempleo
a partir de tres rezagos en la tasa de crecimiento.  Es decir
RD(3)*/

*Hacemos la regresión y obtenemos los residuales
regress d.u g l.g l2.g l3.g
predict e, residuals
regress e l.e, noconstant

*Hacemos el LM
regress e g l.g l2.g l3.g l.e

*Stata ya trae incorporada esta prueba.
*hacemos la regresión inicial
regress d.u g l.g l2.g l3.g
estat bgodfrey, lags(1)
 
*prueba LM de orden superior.
*Hacemos la regresion inicial
regress d.u g l.g l2.g l3.g
*aplicamos el comando con el orden superior que deseamos
estat bgodfrey, lags(10)
*el estadistico Durbin-Watson: d
estat dwatson


