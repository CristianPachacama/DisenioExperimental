source("Code/Ejercicio1/Anovas.R",local = TRUE)
gn = ggplotly(ggqqplot(modelo$residuals,title = "QQPLOT"))
