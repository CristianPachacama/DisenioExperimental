source("Code/Ejercicio2/Anovas.R",local = TRUE)
p_valor=Anv$`Pr(>F)`[1]
if(p_valor<0.05){
  verif = "Se Rechaza \\(H_0\\) a favor de \\(H_1\\) . Luego usando 
  los método de comparación de Tukey y también de Duncan. Así obtenemos los siguiente:"
}else{
  verif = "No se Rechaza \\(H_0\\) . "
}

withMathJax(paste0("Como podemos observar se obtiene un \\(\\text{P-value}=",
                      round(p_valor,digits = 4),"\\) , por lo tanto",verif))
