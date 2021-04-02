* Taller de econometria 2 corte (Monitoria)
import excel "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\ventash.xlsx", sheet("Hoja1") firstrow

tsset Mes
tsline Ventas
summarize

tssmooth ma MA3 =Ventas, window(2)



tsline Ventas AR2 MA3 in 275/275




tssmooth ma MA7 =Ventas, window(7)
tssmooth ma MA12 =Ventas, window(12)






regress Ventas l.Ventas l2.Ventas
regress Ventas l.Ventas l2.Ventas
regress Ventas l.Ventas l2.Ventas
regress Ventas l.Ventas l2.Ventas

