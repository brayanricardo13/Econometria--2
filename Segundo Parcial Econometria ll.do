*Parcial de Econometria ll 2 corte 13/04/2021 
use "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\consumptn.dta"
generate t=1+_n-1
tsset t
summarize

tsline incgwth  
tsline congwth

tsline incgwth congwth

correlate incgwth congwth
twoway (scatter incgwth congwth)
twoway (scatter incgwth congwth) (lfit incgwth congwth)


gen incgwth_1 = incgwth[_n - 1]
gen incgwth_2 = incgwth[_n - 2]
gen congwth_1 = congwth[_n - 1]
gen congwth_2 = congwth[_n - 2]
*ARDL(1,1)
regress incgwth incgwth_1 congwth congwth_1
estat ic
*ARDL(2,1)
regress incgwth incgwth_1 incgwth_2 congwth congwth_1
estat ic
*ARDL(1,2)
regress incgwth incgwth_1 congwth congwth_1 congwth_2 
estat ic
*ARDL(2,2)
regress incgwth incgwth_1 incgwth_2 congwth congwth_1 congwth_2 
estat ic

*ARDL(2,0)
regress incgwth incgwth_1 incgwth_2 