*Parcial de Econometria ll 2 corte 13/04/2021 
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\consumptn.dta"
generate t=1+_n-1
tsset t
summarize

tsline incgwth 
tsline congwth