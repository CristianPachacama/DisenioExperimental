# -------------- Diseño Completamente Aleatorizado ----------------
modelo = lm(Puntos ~ Grupo, data = tabla)
Anv=anova(modelo)
# return(Anv)