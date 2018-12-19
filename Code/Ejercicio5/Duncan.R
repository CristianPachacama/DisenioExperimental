# Test de Duncan 
source("Code/Ejercicio5/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  dun = duncan.test(aov(modelo),trt = 'Molde')
  dun2 = duncan.test(aov(modelo),trt = 'Catalizador')
}else{
  verif = "no_rechaza"
}
