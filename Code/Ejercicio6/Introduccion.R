# -------------- Diseño Factorial (3 factores) ----------------

withMathJax("
Cuando se quiere investigar la influencia de tres factores (A, B y C) sobre una o más
variables de respuesta, y el número de niveles de prueba en cada uno de los factores
es \\(a, b\\) y \\(c\\), respectivamente, se puede construir el arreglo factorial \\(a × b × c\\), que
consiste de \\(a × b × c\\) tratamientos o puntos experimentales. Entre los arreglos de este
tipo que se utilizan con frecuencia en aplicaciones diversas se encuentran: el factorial
\\(2^3\\) , el factorial \\(3^3\\) y los factoriales mixtos con no más de cuatro niveles en dos de los
factores, por ejemplo, el factorial \\(4 × 3 × 2\\) y el factorial \\(4 × 4 × 2\\), por mencionar dos
de ellos.

En un diseño factorial \\(a × b × c\\) como el del ejemplo, se supone que el 
comportamiento de la respuesta Y puede describirse mediante el modelo de efectos dado por:

$$Y_{ijkl} = \\mu + \\alpha_i + \\beta_j + \\gamma_k + ( \\alpha \\beta )_{ij} + ( \\alpha \\gamma )_{ik} + ( \\beta \\gamma )_{jk} + ( \\alpha \\beta \\gamma )_{ijk} + e_{ijkl} ;$$

$$i = 1 , 2 , ... , a ; j = 1 , 2 , ... , b ; k = 1 , 2 , ... , c ; l = 1 , 2 , ... , n$$

donde \\( \\mu \\) es la media general, \\(\\alpha_i\\) es el efecto del nivel i-ésimo del factor \\(A\\), \\(\\beta_j\\) es el
efecto del nivel \\(j\\) del factor \\(B\\) y \\(\\gamma_k\\) es el efecto del nivel \\(k\\) en el factor \\(C\\); \\(( \\alpha \\beta )_{ij}\\) , \\(( \\alpha \\gamma )_{ik}\\)
y \\( ( \\beta \\gamma)_{jk}\\) representan efectos de interacción dobles (de dos factores) en los niveles \\(ij\\),
\\(ik, jk\\), respectivamente, y \\(( \\alpha \\beta \\gamma )_{ijk} \\) es el efecto de interacción triple en la combinación
o punto \\(ijk\\); \\(e_{ijkl}\\) representa el error aleatorio en la combinación \\(ijkl\\) y \\(l\\) son las 
repetciones o réplicas del experimento. Todos los efectos cumplen la restricción de sumar
cero, es decir, son desviaciones relacionadas con la media general \\(\\mu\\).

")