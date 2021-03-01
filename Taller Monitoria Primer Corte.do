*Taller de Monitoria Econometria ll Primer corte 
*Importar las bases de Excel 
import excel "C:\Users\jhona\Desktop\Brayan\6 SEMESTRE 2021-1\Econometria ll\Inventario.xlsx", sheet("Hoja1") cellrange(A1:C47) firstrow
* Declarar la variable INVENTARIOS como una serie de tiempos 
tsset Inventario

* Clear variables Rezagadas atravez del tiempo
gen Ventas_1 = Ventas[_n-1]
gen Ventas_2 = Ventas[_n-2]
gen Ventas_3 = Ventas[_n-3] 

* Minimos cuadrados ordinarios
reg Inventario Ventas Ventas_1  Ventas_2  Ventas_3




