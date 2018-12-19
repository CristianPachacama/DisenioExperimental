# -------------- Diseño Cuadrado Greco-latino ----------------

withMathJax("
Con el diseño en cuadro grecolatino (DCGL) se controlan tres factores de bloque,
además del factor de tratamientos. Se llama cuadro grecolatino porque los cuatro
factores involucrados se prueban en la misma cantidad de nive les, de aquí que se
pueda escribir como un cuadro.
El modelo estadístico que describe a las mediciones en un cuadro grecolatino
está dado por:

$$Y_{ijlm} = \\mu + \\tau_i + \\gamma_j + \\delta_l + \\phi_m + e_{ijlm}$$

donde \\(Y_{ijlm}\\) es la observación o respuesta que se encuentra en el tratamiento \\(i\\) (i-ésima
letra latina), en el renglón \\(j\\), en la columna \\(l\\) y en la m-ésima letra griega; \\(\\tau_i\\) es el
efecto del tratamiento \\(i\\), \\(\\gamma_j\\) es el efecto del renglón \\(j\\), \\(\\delta_l\\) representa el efecto de la 
columna \\(l\\) y \\(\\phi_m\\) representa el efecto de la m-ésima letra griega, que son los niveles del
tercer factor de bloque; el término \\(e_{ijlm}\\) representa el error aleatorio atribuible a la
medición \\(Y_{ijlm}\\) . Es importante no confundir las letras griegas del modelo que 
representan efectos, con las letras griegas en el diseño que simbolizan a los niveles del
tercer factor de bloque.

")