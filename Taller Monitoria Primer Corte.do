*Taller de Monitoria Econometria ll Primer corte 
*Importar las bases de Excel 
import excel "C:\Users\jhona\Desktop\Brayan\6 SEMESTRE 2021-1\Econometria ll\Inventario.xlsx", sheet("Hoja1") cellrange(A1:C47) firstrow
* Declarar la variable INVENTARIOS como una serie de tiempos 
tsset Inventario
twoway (line Inventario Ventas)

* Clear variables Rezagadas atravez del tiempo
gen Ventas_1 = Ventas[_n-1]
gen Ventas_2 = Ventas[_n-2]
gen Ventas_3 = Ventas[_n-3] 

* Minimos cuadrados ordinarios
reg Inventario Ventas Ventas_1  Ventas_2  Ventas_3

* Multicolinealidad 
vif

gen zt0 = Ventas + Ventas_1 + Ventas_2 + Ventas_3

gen zt1 = Ventas_1 + 2*Ventas_2 + 3*Ventas_3

gen zt2 = Ventas_1 + 4*Ventas_2 + 9*Ventas_3

reg Inventario zt0 zt1 zt2
* Diferencias 
gen d1 =  Ventas_1 - Ventas

gen d2 =  Ventas_2 - Ventas

gen d3 =  Ventas_3 - Ventas


reg Inventario Ventas d1 d2 d3
