*Econometria estacionalidad y diferenciacion 
import delimited "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\PIB-INFLACION(1975).csv", parselocale(es_CO) 
generate fecha2 = date(fecha,"DMY")
tsset fecha2, daily 
tsline inflacion
tsline pibrealanual
twoway (tsline pibrealanual),tlabel(, angle(vertical))
twoway (tsline inflacion),tlabel(, angle(vertical))



*Comando de prueba de raiz unitaria con intercepto
generate t=1+_n-1
tsset t
dfuller inflacion, lags(0)
*grafico de la primera diferencia
tsline d.inflacion
dfuller d.inflacion, noconstant lags(0)

*prueba de raiz unitaria con tendencia
 dfuller pibrealanual, trend regress lags(0)
 
tsline d.pibrealanual
*Comando de prueba de raiz unitaria con intercepto
dfuller d.pibrealanual, regress lags(0)

*comparemos
*cuando las variables no son estacionarias:
regress inflacion l.inflacion pibrealanual l.pibrealanual l2.pibrealanual
*cuando las variables son estacionarias
regress d.inflacion l.d.inflacion d.pibrealanual l.d.pibrealanual l2.d.pibrealanual

