# -------------- Diseño Factorial (2 factores) ----------------
tags$div(
withMathJax("
Para un diseño factorial (\\( a × b\\)) con n réplicas resulta de descomponer la variación total
como,
$$SC_T = SC_A + SC_B + SC_{AB} + SC_E$$
donde los respectivos grados de libertad de cada una de ellas son:
$$nab - 1 = ( a - 1 ) + ( b - 1 ) + ( a - 1 )( b - 1 ) + ab ( n - 1 )$$

El factor \\((n - 1)\\) en los grados de libertad de la suma de cuadrados del error
\\((SC e )\\) señala que se necesitan al menos dos réplicas del experimento para calcular
este componente y, por ende, para construir una tabla de ANOVA. Recordemos que
las sumas de cuadrados divididas entre sus correspondientes grados de libertad se
llaman cuadrados medios (CM). Al dividir éstos entre el cuadrado medio del error
(CM E ) se obtienen estadísticos de prueba con distribución F. Toda esta información
se sintetiza en la tabla ANOVA.
")
,p(img(src="Disenios/disenio4.png",width="640"),align="center")

)