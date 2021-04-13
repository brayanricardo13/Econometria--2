* Taller de econometria 2 corte (Monitoria)
import excel "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ventash.xlsx", sheet("Hoja1") firstrow

generate Fecha=1+_n-1
tsset Fecha
tsset Mes 
tsline Ventas
summarize

*AR(1)
gen Ventas_1 = Ventas[_n - 1]
regress Ventas  Ventas_1 
estat ic
* AR(2)
gen Ventas_2 = Ventas[_n - 2]
regress Ventas  Ventas_1  Ventas_2 
estat ic
*AR(3)
gen Ventas_3 = Ventas[_n - 3]
regress Ventas  Ventas_1  Ventas_2  Ventas_3 
estat ic
*AR(4)
gen Ventas_4 = Ventas[_n - 4]
regress Ventas  Ventas_1  Ventas_2  Ventas_3  Ventas_4
estat ic

*AR(1)
regress Ventas l.Ventas
*AR(2)
regress Ventas l.Ventas l2.Ventas 
*AR(3)
regress Ventas l.Ventas l2.Ventas l3.Ventas 
*AR(4)
regress Ventas l.Ventas l2.Ventas l3.Ventas l4.Ventas 

*AR(3)
regress Ventas l.Ventas l2.Ventas l3.Ventas 
tsappend, add(2)
predict AR3
*Segundo Pronostico
replace AR3=_b[_cons]+_b[l.Ventas]*AR3[276]+_b[l2.Ventas]*Ventas[275]+_b[l3.Ventas]*Ventas[274] in 277
tsline Ventas AR3
*Intervalos de confianza
* Primer Pronostico
*limite inferior
generate LI=AR3-(1.96*5.9696)
*limite superior
generate LS=AR3+(1.96*5.9696)
tsline Ventas AR3 LI LS in 257/277
*segundo pronostico 


*Promedio Movil 

tssmooth ma MA3 =Ventas, window(3)
tssmooth ma MA7 =Ventas, window(7)
tssmooth ma MA12 =Ventas, window(12)


tsline Ventas MA3
tsline Ventas MA7
tsline Ventas MA12

tsline Ventas MA3 MA7 MA12

*Suavizamiento Exponencial 

tssmooth exponential SExp5 = Ventas, parms(0.5)
tssmooth exponential SExp8 = Ventas, parms(0.8)
tssmooth exponential SExp9 = Ventas, parms(0.9)

tsline Ventas SExp5
tsline Ventas SExp8
tsline Ventas SExp9

**********************************************************************************
import delimited "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ventash.csv"

generate fecha = date(mes,"DMY")
tsset fecha, daily

regress ventas l.ventas

generate time=1+_n-1
tsset time




tsline ventas
summarize





tssmooth ma MA3 =Ventas, window(3)



tsline Ventas AR2 MA3 in 275/275




tssmooth ma MA7 =Ventas, window(7)
tssmooth ma MA12 =Ventas, window(12)





