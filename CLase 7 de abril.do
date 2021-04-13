*Econometria 2 clase 7/04/2021
* Simulacion del modelo AR(1)
*Una base de datos con 1000 Observaciones
set obs 1000
*Vamos a crear una variable aleatoria con media cero y varianza 1 
generate vt=rnormal(0,1)
generate t=1+_n-1
tsset t 

* El modelo AR(1) yt=py(t-1)+vt
*supóngamos que p=0.7 
generate yt=1 
replace yt=(0.7*l.yt)+vt in 2/1000
tsline yt 

sum yt in 1/500
sum yt in 501/1000


*supóngamos que p=1
generate yt=1 
replace yt=(1*l.yt)+vt in 2/1000
tsline yt 

sum yt in 1/500
sum yt in 501/1000
