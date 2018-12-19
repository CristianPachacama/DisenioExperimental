#Grafico de Cajas
p = plot_ly(tabla, y = ~Temperatura, color = ~Dia, type = "box",boxpoints = 'all',boxmean="sd")

