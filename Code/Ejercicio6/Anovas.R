# -------------- Diseño Factorial (3 factores) ----------------
modelo = lm(Ancho ~ Parte*Operador*Ensayo,data = tabla)
Anv = anova(modelo)
# return(anova(modelo))
