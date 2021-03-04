*Modelos ARDL y criterios de información.
generate t=1+_n-1
tsset t 
*ARDL(1,0)
regress d.u l.d.u g
estat ic

*ARDL (1, 1)
regress d.u l.d.u g l.g
estat ic

*ARDL (2, 3)
regress d.u l.d.u l2.d.u l(0/3).g
estat ic
