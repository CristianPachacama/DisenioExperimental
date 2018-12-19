# -------------- Diseño Factorial (2 factores) ----------------

withMathJax("
Considere los factores \\(A\\) y \\(B\\) con \\(a\\) y \\(b\\) \\((a, b \\geq 2)\\) niveles de prueba, respectivamente. Con
ellos se puede construir el arreglo o diseño factorial \\(a × b\\), el cual consiste en \\(a × b\\))
tratamientos. Algunos casos particulares de uso frecuente son: el factorial \\(2^2\\) , el 
factorial \\(3^2\\) y el factorial \\(3 × 2\\). Se llama réplica a cada corrida completa del arreglo
factorial. Los diseños factoriales que involucran menos de cuatro factores por lo 
regular se corren replicados para tener la potencia necesaria en las pruebas estadísticas
sobre los efectos de interés. Si se hacen n réplicas, el número total de corridas 
experimentales es \\(n(a × b)\\).

El modelo estadístico de efectos para este tipo de diseño está dado por:

$$ Y_{ijk} = \\mu + \\alpha_i + \\beta_j + ( \\alpha \\beta )_{ij} + e_{ijk} ;$$
$$i = 1 , 2 , ... , a ; j = 1 , 2 , ... , b ; k = 1 , 2 , ... , n$$

donde \\(m\\) es la media general, \\(\\alpha_i\\) es el efecto debido al i-ésimo nivel del factor \\(A\\), \\(\\beta_j\\) es
el efecto del j-ésimo nivel del factor \\(B\\), \\(( ab )_{ij}\\) representa al efecto de interacción en
la combinación \\(ij\\) y \\(e_{ijk}\\) es el error aleatorio que se supone sigue una distribución normal con media cero y varianza constante
\\(\\sigma^2\\)

")