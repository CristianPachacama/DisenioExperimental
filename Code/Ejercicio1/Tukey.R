source("Code/Ejercicio1/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  tuk = TukeyHSD(x=aov(modelo), 'Grupo')
}else{
  verif = "no_rechaza"
}

# tuk = TukeyHSD(x=aov(modelo), 'Grupo')
# return(tuk)