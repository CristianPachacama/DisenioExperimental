# ------ Diseño con bloques Completamente Aleatorizado---------

withMathJax("
Cuando se quieren comparar ciertos tratamientos o estudiar el efecto de un factor, es
deseable que las posibles diferencias se deban principalmente al factor de interés y
no a otros factores que no se consideran en el estudio. Cuando esto no ocurre y existen 
otros factores que no se controlan o nulifican para hacer la comparación, las
conclusiones podrían ser afectadas sensiblemente.

A los factores adicionales al factor de interés que se incorporan de manera explícita
en un experimento comparativo se les llama factores de bloque. Éstos tienen la par-
ticularidad de que no se incluyen en el experimento porque interese analizar su efec-
to, sino como un medio para estudiar de manera adecuada y eficaz al factor de interés

Cuando se decide utilizar un DBCA, el experimen tador piensa que cada medición
será el resultado del efecto del tratamiento donde se encuentre, del efecto del bloque
al que pertenece y de cierto error que se espera sea aleatorio. El modelo estadístico
para este diseño está dado por:

$$Y_{ij} = \\mu + \\tau_i + \\gamma_j + + e_{ij}$$

$$i = 1 , 2 , ... , a ; j = 1 , 2 , ... , b $$

donde \\(Y_{ij}\\) es la medición que corresponde al tratamiento \\(i\\) y al bloque \\(j\\);
\\(m\\) es la media global poblacional; \\(\\tau_i\\) es el efecto debido al tratamiento \\(i\\), \\( \\gamma_j\\) es el efecto
debido al bloque \\(j\\) y \\( \\varepsilon_{ij} \\) es el error aleatorio atribuible a la medición \\(Y_{ij}\\)

")