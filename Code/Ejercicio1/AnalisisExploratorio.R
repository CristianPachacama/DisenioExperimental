#Grafico de Cajas
p = plot_ly(tabla, y = ~Puntos, color = ~Grupo, type = "box",boxpoints = 'all',boxmean="sd")