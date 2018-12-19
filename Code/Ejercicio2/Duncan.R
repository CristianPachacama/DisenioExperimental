# Test de Duncan 
source("Code/Ejercicio2/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  dun = duncan.test(aov(modelo),trt = 'Dia')
}else{
  verif = "no_rechaza"
}
