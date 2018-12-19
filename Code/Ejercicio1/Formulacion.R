# -------------- Diseño Completamente Aleatorizado ----------------
tags$div(
withMathJax("
El análisis de varianza (ANOVA) es la técnica central en el análisis de datos experimentales. 
La idea general de esta técnica es separar la variación total en las partes
con las que contribuye cada fuente de variación en el experimento. En el caso del
DCA se separan la variabilidad debida a los tratamientos y la debida al error, es decir,
se puede escribir las sumas de cuadrados (SC) correspondientes como sigue:
$$SC_T = SC_{TRAT} + SC_E$$

Como hay un total de \\(N = \\sum_i n_i\\) observaciones, la \\(SC_T\\) tiene \\(N - 1\\) grados de
libertad. Hay \\(k\\) tratamientos o niveles del factor de interés, así que \\(SC_{TRAT}\\) tiene \\(k - 1\\)
grados de libertad, mientras que la \\(SC_E\\) tiene \\(N - k\\). Los grados de libertad cumplen una relación similar dada por:
$$N-1 = (k-1) + (N-k)$$
")
,p(img(src="Disenios/disenio1.png",width="640"),align="center")

)