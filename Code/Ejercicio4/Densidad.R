# Grafico de Densidad de los Residuos
source("Code/Ejercicio4/Anovas.R",local = TRUE)
dn = ggplot(data.frame(Residuos=modelo$residuals), aes(x=Residuos)) + 
  geom_histogram(aes(y = ..density..), alpha = 0.7, fill = "#333333") + 
  geom_density(fill = "#ff4d4d", alpha = 0.5) + 
  theme(panel.background = element_rect(fill = '#ffffff')) + 
  ggtitle("Densidad e Histograma de Residuos")

dn = ggplotly(dn)

