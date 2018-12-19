# Test de Duncan 
source("Code/Ejercicio1/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  dun = duncan.test(aov(modelo),trt = 'Grupo')
}else{
  verif = "no_rechaza"
}
