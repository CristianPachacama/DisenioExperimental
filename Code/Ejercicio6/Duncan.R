# Test de Duncan 
source("Code/Ejercicio6/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "rechaza"
  dun = duncan.test(aov(modelo),trt = 'Parte')
  dun2 = duncan.test(aov(modelo),trt = 'Operador')
  dun3 = duncan.test(aov(modelo),trt = 'Ensayo')
}else{
  verif = "no_rechaza"
}
