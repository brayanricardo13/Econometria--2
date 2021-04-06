* Taller de econometria 2 corte (Monitoria)
import excel "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ventash.xlsx", sheet("Hoja1") firstrow

tsset Mes
tsline Ventas
summarize


gen Ventas_1 = Ventas[_n - 1]
gen Ventas_2 = Ventas[_n - 2]
gen Ventas_3 = Ventas[_n - 3]
gen Ventas_4 = Ventas[_n - 4]


regress Ventas  Ventas_1 
regress Ventas  Ventas_1  Ventas_2 
regress Ventas  Ventas_1  Ventas_2  Ventas_3 
regress Ventas  Ventas_1  Ventas_2  Ventas_3  Ventas_4





































import delimited "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ventash.csv"

generate fecha = date(mes,"DMY")
tsset fecha, daily

gen Ventas_1 = ventas [_n-1]
gen Ventas_2 = ventas [_n - 2]
gen Ventas_3 = ventas  [_n - 3]
gen Ventas_4 = ventas  [_n - 4]






tsline ventas
summarize





tssmooth ma MA3 =Ventas, window(3)



tsline Ventas AR2 MA3 in 275/275




tssmooth ma MA7 =Ventas, window(7)
tssmooth ma MA12 =Ventas, window(12)





