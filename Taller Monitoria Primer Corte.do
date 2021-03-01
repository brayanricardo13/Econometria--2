*Taller de Monitoria Econometria ll Primer corte 
*Importar las bases de Excel 
import excel "C:\Users\jhona\Desktop\Brayan\6 SEMESTRE 2021-1\Archivos Econometria ll\Inventario.xlsx", sheet("Hoja1") cellrange(A1:C47) firstrow
* Declarar la variable INVENTARIOS como una serie de tiempos 
tsset Inventario





