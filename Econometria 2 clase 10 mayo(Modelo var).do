* Econometria 2 clase 10 mayo(Modelo var)
import delimited "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\PIB-INFLACION(1975).csv", parselocale(es_CO)

gen Fecha2 =date(fecha,"DMY")
tsset Fecha2,daily

twoway (tsline pibrealanual), tlabel(, angle(vertical)) tmtick(, angle(vertical))
twoway (tsline inflacion), tlabel(, angle(vertical)) tmtick(, angle(vertical))


generate t=1+_n-1
tsset t 


*Estimar la primera ecuación
regress d.pibrealanual l.d.inflacion l.d.pibrealanual
*Estimar la segunda ecuación
regress d.inflacion l.d.inflacion l.d.pibrealanual
*Estimacion bajo el comando de STATA
varbasic d.pibrealanual d.inflacion, lags(1/1) step(8)
*Test de causalidad de Granger
vargranger

*VAR(2)
varbasic d.pibrealanual d.inflacion, lags(1/2) step(8)
vargranger

clear