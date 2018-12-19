# ------ Bloques Completamente Aleatorizado ---------
modelo = lm(Temperatura ~ Dia + Silo, data = tabla)
Anv=anova(modelo)

