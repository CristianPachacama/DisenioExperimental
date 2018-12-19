# Verificar paquetes ----------------------
pkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Paquete no encontrado")
  }
}
pkgTest("shinythemes")
pkgTest("lmtest")
pkgTest("agricolae")
pkgTest("DT")
pkgTest("plotly")
pkgTest("ggpubr")

#Carga de Paquetes -------------------------
library(shiny)
library(shinythemes)
library(lmtest)
library(agricolae)
library(DT)
library(plotly)
library(ggplot2)
library(ggpubr)
# Carga de Datos ejemplo  -------------------
set.seed(225)
Bloque = factor(rep(c(1:4), each = 8))
Tratamiento = factor(rep(c("15min", "30min"), each = 16))
Estimulo = c(rnorm(16, 5, 2), rnorm(16, 7, 2))
datos = data.frame(Bloque, Tratamiento, Estimulo)

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ----------------------- User Interface  -------------------------
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ui = navbarPage(title = "Diseño Experimental",
                header = tags$h3("Header-Plataforma",tags$head(tags$link(rel='shortcut icon', 
                                                                         href='puce.ico', 
                                                                         type='image/x-icon'))),
                position = "fixed-top",theme=shinytheme('yeti'),#theme = 'estilo.css',
                footer = fluidRow(column(12,img(src='puce_logo.png',width='90px',align='center'),
                                         tags$b('Proyecto: '),' "Análisis del Poder de Mercado (Series IPC)".' ,
                                         '-',tags$a('Instituto de Investigaciones Económicas - PUCE (2018)',href='https://www.puce.edu.ec'),
                                         tags$b('  ||  '),tags$b('Desarrollado por: '),
                                         tags$a('Cristian Pachacama',href='http://www.linkedin.com/in/cristian-david-pachacama')
                )
                ),
  
  # title = "Diseño Experimental",
  #               header = tags$h3("Header-Plataforma",tags$head(tags$link(rel='stylesheet', 
  #                                                                        type='text/css', 
  #                                                                        href='estilo.css'),
  #                                                              tags$link(rel='shortcut icon', 
  #                                                                        href='icono.ico', 
  #                                                                        type='image/x-icon')
  #               )
  #               ),
  #               position = "fixed-top",theme=shinytheme('flatly'),
  #               
                
                tabPanel(" ",icon=icon('home'),
                         #Titulos ------------------
                         h3(' '),
                         p(img(src="puce_logo2.png",height="80"),align="center"),
                         h1("Diseño Experimental",align="center"),
                         # p(img(src="logo2.png",height="70"),align="center"),
                         h3("Cristian Pachacama", align= "center"),
                         # p( tags$b("NRC:"), "3829",align="center"),
                         p(" ",align="center"),
                         p( tags$b("Fecha:"), "19 de diciembre del 2018",align="center"),
                         p("Está plataforma consta de 6 tipos de diseños de experimentos, en donde se
                           detallan aspectos teóricos y prácticos de los mismos, análisis ANOVA, Normalidad,
                           y Homocedastecidad.",
                           align="center"),
                         # p( tags$b("Ingeniero:"), "Pedro Romero Saker",align="center"),
                         hr()
                         ),
                
                
                tabPanel("Ejemplos",
                         # Panel Lateral -----------
                         sidebarPanel(
                           # Eleccion del Disenio
                           h4("Tipo de Diseño"),
                           p("A continuación elija que tipo de diseño experimental que desea ralizar con los datos."),
                           selectInput(inputId = "disenio",label="Tipo de Diseño:",selected = 1,
                                       choices = c("Completamente Aleatorizado"=1,
                                                   "Bloques Completamente Aleatorizado"=2,
                                                   "Cuadrado Latino"=3,
                                                   "Cuadrado Greco-latino"=4,
                                                   "Factorial (2 factores)"=5,
                                                   "Factorial (3 factores)"=6
                                       )),
                           # Carga de Datos
                           h4("Carga de Datos"),
                           p("A continuación busque el archivo con los datos que desea analizar"),
                           fileInput('file1', 'Escoja un Archivo',
                                     accept = c(
                                       'text/csv',
                                       'text/comma-separated-values',
                                       'text/tab-separated-values',
                                       'text/plain',
                                       '.csv',
                                       '.tsv'
                                     )
                           ),
                           p("O si prefiere ingerse el URL del archivo, por ejemplo: ",
                             a(href=' http://samplecsvs.s3.amazonaws.com/Sacramentorealestatetransactions.csv'),"Sacramento"),
                           textInput(inputId = 'directorio',label = "Ingrese URL:"),
                           p(tags$b('Nota:'),'Es necesario que los datos que se carguen, esten en el mismo formato que los expuestos en los ejercicios, 
                             (es decir, las variables con el mismo nombre) y en formato *.csv.'
                           )
                          
                         ),
                         
                         
                         # Panel Principal ---------
                         mainPanel(
                           titlePanel(" "),
                           uiOutput(outputId = "titulo"),
                           uiOutput(outputId = "introduccion"),
                           uiOutput(outputId = "tituloForm"),
                           uiOutput(outputId = "formulacion"),
                           p("A continuación se presenta una tabla con los Datos Cargados y su respectivo Análisis."),
                           
                           # Enunciado de Ejercicio  --------------
                           h3("Ejercicio"),
                           uiOutput(outputId = "enunciado"),
                           
                           
                           # Solución -----------------------------
                           tabsetPanel(
                             tabPanel("Tabla de Datos",
                                      tags$br(),
                                      p('A continuación se muestra la tabla de datos que cargó a la aplicación.'),
                                      #Tabla de Datos
                                      dataTableOutput("tabla")   
                                      
                             ),
                             
                             tabPanel("Análisis Exploratorio",
                                      p("A continuación se muestra un gráfico que resume el comportamiento de los datos"),
                                      
                                      
                                      #Grafico de Cajas
                                      plotlyOutput(outputId = "grafCajas")
                                      
                                      ),
                             
                             tabPanel("ANOVA",
                                      tags$br(),
                                      p('A continuación mostramos un resumen del análisis ANOVA de los datos cargados.'),
                                      #Tabla ANOVA
                                      verbatimTextOutput("anova"),
                                      tags$br(),
                                      #Conclusion Pvalor
                                      uiOutput(outputId = "pvalor"),
                                      tags$br(),
                                      # Comparación de Tukey
                                      verbatimTextOutput("tukey"),
                                      tags$br(),
                                      
                                      # Comparación de Tukey
                                      verbatimTextOutput("duncan"),
                                      tags$br()
                                      
                             ),
                             #Test de Normalidad --------------------
                             tabPanel("Normalidad",
                                      
                                      tags$br(),
                                      p("En esta sección mostramos algunos test de normalidad 
                                        de los residuos del modelo, tanto gráficos como analíticos.
                                        Primero mostramos el histograma y densidad de los residuos."),
                                      
                                      plotlyOutput(outputId = "densidadGraf"),
                                      tags$br(),
                                      
                                      p("Luego tenemos un QQ Plot que compara la distribución que siguen
                                        los datos, versus la distribución teórica Normal."),
                                      tags$br(),
                                      
                                      plotlyOutput(outputId = "normalGraf"),
                                      
                                      tags$br()
                                      ),
                             #Test de Homocedasticidad  --------------
                             tabPanel("Homocedasticidad",
                                      
                                      tags$br(),
                                      p("En esta sección mostramos el test de Breusch-Pagan de Homocedasticidad
                                        de los residuos del modelo."),
                                      verbatimTextOutput(outputId = "homocedGraf"),tags$br()
                             )
                             
                             
                             
                           )
                           
                         )
                         
                         
                         )
                
                
                )

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# -----------------------      Server     -------------------------
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
server = function(input, output) {
  
  #----------------------------------------
  #Introducción del Diseño específico -----
  #----------------------------------------
  
  # Titulo
  output$titulo = renderUI({
    
    if(is.null(input$disenio)){
      return()
    }
    
    switch(as.character(input$disenio),
           '1'={h3("Diseño Completamente Aleatorizado")},
           '2'={h3("Diseño con bloques Completamente Aleatorizado")},
           '3'={h3("Diseño Cuadrado Latino")},
           '4'={h3("Diseño Cuadrado Greco-latino")},
           '5'={h3("Diseño Factorial (2 factores)")},
           '6'={h3("Diseño Factorial (3 factores)")}
           
    )
  })
  
  #Introduccion al Modelo.
  output$introduccion = renderUI({
    
    if(is.null(input$disenio)){
      return()
    }
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Introduccion.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Introduccion.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Introduccion.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Introduccion.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Introduccion.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Introduccion.R",local = TRUE)}
    )
  })
  
  #Teoria ANOVA
  
  # Formulacion
  output$tituloForm= renderUI({
    h4("ANOVA para este diseño")
  })
  output$formulacion = renderUI({
    
    if(is.null(input$disenio)){
      return()
    }
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Formulacion.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Formulacion.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Formulacion.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Formulacion.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Formulacion.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Formulacion.R",local = TRUE)}
    )
  })
  

  
  #----------------------------------------
  #Enunciado Ejercicio  -------------------
  #----------------------------------------
  
  output$enunciado = renderUI({
    
    if(is.null(input$disenio)){
      return()
    }
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Enunciado.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Enunciado.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Enunciado.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Enunciado.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Enunciado.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Enunciado.R",local = TRUE)}
    )
  })
  
  #----------------------------------------
  #Tabla de Datos--------------------------
  #----------------------------------------
  datos_cargados = reactive({

    #Carga por defecto
    inFile = input$file1
    if(is.null(inFile)){
      switch(as.character(input$disenio),
             '1'={datos_cargados = read.table(file="Data/Ejercicio1.csv",header = TRUE,sep = ",",dec = ".")},
             '2'={datos_cargados = read.table(file="Data/Ejercicio2.csv",header = TRUE,sep = ",",dec = ".")},
             '3'={datos_cargados = read.table(file="Data/Ejercicio3.csv",header = TRUE,sep = ",",dec = ".")},
             '4'={datos_cargados = read.table(file="Data/Ejercicio4.csv",header = TRUE,sep = ",",dec = ".")},
             '5'={datos_cargados = read.table(file="Data/Ejercicio5.csv",header = TRUE,sep = ",",dec = ".")},
             '6'={datos_cargados = read.table(file="Data/Ejercicio6.csv",header = TRUE,sep = ",",dec = ".")}
      )
      
      return(datos_cargados)
    }
    # Carga desde la consola
    datos_cargados = read.table(inFile$datapath, 
                                 header = TRUE, 
                                 sep = ",",
                                 dec = ".")
    nombres = names(datos_cargados)
    for (i in 1:ncol(datos_cargados)) {
      if(nombres[i] != "Puntos"){
        datos_cargados[, i] = as.factor(datos_cargados[, i])
      }else{
        datos_cargados[, i] = as.numeric(datos_cargados[, i])
      }
    }
    datos_cargados
  })
  
  output$tabla <- renderDataTable({
    datatable(datos_cargados(), rownames = T)
    
  })
  
  #----------------------------------------
  #Análisis Exploratorio  -----------------
  #----------------------------------------
  
  output$grafCajas = renderPlotly({
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/AnalisisExploratorio.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/AnalisisExploratorio.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/AnalisisExploratorio.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/AnalisisExploratorio.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/AnalisisExploratorio.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/AnalisisExploratorio.R",local = TRUE)}
    )
    
    p
  })
  
  
  #----------------------------------------
  #Tabla ANOVA ----------------------------
  #----------------------------------------
  output$anova = renderPrint({
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Anovas.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Anovas.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Anovas.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Anovas.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Anovas.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Anovas.R",local = TRUE)}
    )
    print(Anv)
  })
  
  output$pvalor = renderUI({
    tabla = datos_cargados()
    if(is.null(input$disenio)){
      return()
    }
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Pvalor.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Pvalor.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Pvalor.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Pvalor.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Pvalor.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Pvalor.R",local = TRUE)}
    )
  })
  
  # Comparación de Tukey
  output$tukey = renderPrint({
    
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Tukey.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Tukey.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Tukey.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Tukey.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Tukey.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Tukey.R",local = TRUE)}
    )
    if(exists("tuk")){print(tuk)}
    if(exists("tuk2")){print(tuk2)}
    if(exists("tuk3")){print(tuk3)}
  })
  # Comparación de Duncan
  output$duncan = renderPrint({
    
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Duncan.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Duncan.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Duncan.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Duncan.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Duncan.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Duncan.R",local = TRUE)}
    )
    if(exists("dun")){print(dun)}
    if(exists("dun2")){print(dun2)}
    if(exists("dun3")){print(dun3)}
  })
  
  #Test de Normalidad -------------------
  output$normalGraf = renderPlotly({
    
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Normalidad.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Normalidad.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Normalidad.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Normalidad.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Normalidad.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Normalidad.R",local = TRUE)}
    )
    gn
  })
  #Grafico de Densidad-------------------
  output$densidadGraf = renderPlotly({
    
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Densidad.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Densidad.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Densidad.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Densidad.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Densidad.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Densidad.R",local = TRUE)}
    )
    dn
  })
  
  
  #Test de Homocedasticidad -------------------
  output$homocedGraf = renderPrint({
    
    tabla = datos_cargados()
    
    switch(as.character(input$disenio),
           '1'={source("Code/Ejercicio1/Homocedasticidad.R",local = TRUE)},
           '2'={source("Code/Ejercicio2/Homocedasticidad.R",local = TRUE)},
           '3'={source("Code/Ejercicio3/Homocedasticidad.R",local = TRUE)},
           '4'={source("Code/Ejercicio4/Homocedasticidad.R",local = TRUE)},
           '5'={source("Code/Ejercicio5/Homocedasticidad.R",local = TRUE)},
           '6'={source("Code/Ejercicio6/Homocedasticidad.R",local = TRUE)}
    )
    if(exists("hmc")){print(hmc)}
  })
  
  
}

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# -----------------------     Run App     -------------------------
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
shinyApp(ui, server)