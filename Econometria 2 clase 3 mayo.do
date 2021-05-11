*modelo de corrección de error
generate t=1+_n-1
tsset t 
*creamos las variables en primera diferencia
gen db=d.b
gen df=d.f
*usando minimos cuadrados no lineales
 nl (db = -{\alpha}*(l.b-{\beta0}-{beta1}*l.f)+{\delta0}*df), variables(df db f b)

 *Podemo primero obtener los residuales
 regress l.b l.f
 predict e, residuals
 *estimamos el modelo de correccion de error
 regress db e df, noconstant 
