source("Code/Ejercicio5/Anovas.R",local = TRUE)
gn = ggplotly(ggqqplot(modelo$residuals,title = "QQPLOT"))
