source("Code/Ejercicio6/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  tuk = TukeyHSD(x=aov(modelo), 'Parte')
  tuk2 = TukeyHSD(x=aov(modelo), 'Operador')
  tuk3 = TukeyHSD(x=aov(modelo), 'Ensayo')
}else{
  verif = "no_rechaza"
}

# return(tuk)