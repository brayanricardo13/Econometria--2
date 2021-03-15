*15/03/2021 Pronostico 
* pib real trimestral 
*Importar datos 

import delimited "C:\Users\jhona\Desktop\Brayan\Github\Econometria--2\BASES DE DATOS\PIB Real Trimestral.csv", encoding(UTF-8) parselocale(es_CO) clear 
* Crear variable de tiempo 
generate fecha2 = date(fecha,"DMY")
tsset fecha2, daily

tsline pibrealtrimestral

* 


