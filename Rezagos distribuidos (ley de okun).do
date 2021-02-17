*Ejemplo de la ley de Okun
*Febrero 10
describe
*Hay que declarar la base de datos como de series de tiempo.
*Lo primero es crear una variable que contenga el tiempo.
generate t=1+_n-1
*Ahora declaramos la base de datos como de serie de tiempo:
tsset t

*Podemos graficar el desempleo
tsline u
*Anotación: el operador para la primera diferencia es d.
* el operador para la segunda diferencia es d2.
*Graficar la primera diferencia del desempleo
tsline d.u
/*Podemos hacer la tabla con el desempleo, el primer rezago
el segundo rezago, la primera diferencia y la segunda diferencia.*/
*Anotacion: el operador de rezagos en stata es l.
*La tabla sería:
list u l.u l2.u d.u d2.u in 1/20

*la grafica de la tasa de crecimiento es:
tsline g

*Podemos estimar el modelo de la ley de Okun
regress d.u g

*Estimamos el modelo RD de orden 4
regress d.u g l.g l2.g l3.g l4.g


