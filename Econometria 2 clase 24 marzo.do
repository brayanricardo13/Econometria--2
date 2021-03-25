*Pronósticos 
*Vamos a pronosticar la serie sales (hacer 2 pronosticos).

*creamos la variable de tiempo:
generate time=1+_n-1
tsset time

tsline sales
sum sales

*AR(2)
regress sales l.sales l2.sales
*agregamos dos observaciones más en STATA
tsappend, add(2)
predict AR2
*El segundo pronóstico
replace AR2=_b[_cons]+_b[l.sales]*AR2[106]+_b[l2.sales]*sales[105] in 107
tsline sales AR2 in 90/107
*Intervalos de confianza
*limite inferior
generate LI=AR2-(1.96*1.8615)
*limite superior
generate LS=AR2+(1.96*1.8615)
tsline sales AR2 LI LS in 90/107

*el intervalo de confianza en el segundo pronostico
*limite inferior
replace LI=AR2-(1.96*2.021) in 107
*limite superior
replace LS=AR2+(1.96*2.021) in 107




*Promedio movil de orden 3
*MA(3)
tssmooth ma MA3 = sales, window(3)
*corregimos el segundo pronostico
replace MA3=(sales[105]+sales[104]+MA3[106])/3 in 107


tsline sales AR2 MA3 in 90/107 


*suavizamiento exponencial con alpha 0.8

tsline sales AR2 MA3 SExp in 90/107 










