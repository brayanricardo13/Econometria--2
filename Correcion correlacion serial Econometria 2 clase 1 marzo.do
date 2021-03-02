*Correccion de correlación serial. 2/03/2021
use "C:\Users\jhona\Downloads\okun.dta"
generate t=1+_n-1
tsset t

*hacemos la regresión del modelo lineal equivalente
regress d.u l.d.u g l.g l2.g

*hacemos la prueba de hipotesis
testnl (_b[l2.g]=-_b[ld.u]*(_b[l1.g]+_b[ld.u]*_b[g]))


