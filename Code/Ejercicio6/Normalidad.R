source("Code/Ejercicio6/Anovas.R",local = TRUE)
gn = ggplotly(ggqqplot(modelo$residuals,title = "QQPLOT"))
