source("Code/Ejercicio2/Anovas.R",local = TRUE)
gn = ggplotly(ggqqplot(modelo$residuals,title = "QQPLOT"))
