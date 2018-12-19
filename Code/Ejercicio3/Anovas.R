# -------------- Diseño Cuadrado Latino ----------------
modelo = lm(Peso_Ratas ~ Dieta+Apetito+Peso_Inicial, data = tabla)
Anv=anova(modelo)
