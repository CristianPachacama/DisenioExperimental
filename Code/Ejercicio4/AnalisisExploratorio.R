#Grafico de Cajas
p = plot_ly(tabla, y = ~Costo, color = ~Ruta, type = "box",boxpoints = 'all',boxmean="sd")