#Grafico de Cajas
p = plot_ly(tabla, y = ~Peso_Ratas, color = ~Dieta, type = "box",boxpoints = 'all',boxmean="sd")