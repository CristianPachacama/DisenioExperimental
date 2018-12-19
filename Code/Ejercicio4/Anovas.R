# -------------- Diseño Cuadrado Greco-latino ----------------
modelo = lm(Costo ~ ., data = tabla)
Anv = anova(modelo)
# return(anova(modelo))