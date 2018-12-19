source("Code/Ejercicio3/Anovas.R",local = TRUE)
gn = ggplotly(ggqqplot(modelo$residuals,title = "QQPLOT"))
