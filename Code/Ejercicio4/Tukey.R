source("Code/Ejercicio4/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  tuk = TukeyHSD(x=aov(modelo), 'Ruta')
}else{
  verif = "no_rechaza"
}

# return(tuk)