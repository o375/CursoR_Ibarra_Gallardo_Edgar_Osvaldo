library(tidyverse)

library(dplyr)

paises <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")

colnames(paises) <- c("Fecha_de_reporte", 
                      "Código_de_país", 
                      "Paises", "Región_OMS" ,
                      "Casos_Nuevos", 
                      "Casos_Acumulados", 
                      "Defunciones_Nuevas", 
                      "Defunciones_Acumuladas")


#Con la siguiente función es posible estandarizar las fechas de nuestra dataset
#Como se puede observar al final de la función, para este ejemplo estandarizamos la fecha con base en el formato YEAR/MONTH/DAY
paises$Fecha_de_reporte <- as.Date(paises$Fecha_de_reporte, format = "%Y-%m-%d" )

#Funciones de uso frecuente

#Select
#Esta función nos permite seleccionar únicamente aquellas variables o columnas de nuestra dataset
#Para este ejemplo, únicamente seleccionamos las columnas que contienen los datos relacionados con los nombres de los países, las fechas de reportes y los casos acumulados
paises_filtrados <- select(paises, Fecha_de_reporte, Paises, Casos_Acumulados )

#Filter
#Al ejecutar esta función podemos observar que nuestra base de datos denominada paises_filtrados contendrá únicamente aquellos datos cuya fecha de reporte estén entre el 5 de noviembre y 5 de diciembre del 2020)
#Con ello, será posible analizar u observar únicamente aquellos datos que por el momento son requeridos
paises_filtrados <- filter(paises_filtrados, Fecha_de_reporte >" 2020-11-05" & Fecha_de_reporte < "2020-12-05")

#Rename
#Al ejecutar esta función, como puede observarse, la columa que anteriormente se denominaba "Casos_Acumulados" ha pasado a denominarse como "Total_de_casos" 
#Lo anterior será útil, pues a medida que vamos seleccionando y filtrando nuestra base de datos con las funciones anteriores, puede que requiramos renombrar nuestras variables o columnas
paises_filtrados <- rename(paises_filtrados, Total_de_casos = Casos_Acumulados)

#Mutate
#Al ejecutar esta función podemos observar en nuestra base países_filtrados una nueva columna; es decir, con la función mutate agregaremos una nueva variable utilizando como base un dataset existente. 
#Para este ejemplo la nueva variable o columna utilizará los datos contenidos en la columna Total de casos, multiplicará cada dato por un millón y a su vez lo dividirá entre en 5. El resultadp de esa operación será lo que contendrá la nueva columna
#Asimismo, cabe notar que la función str_to_title nos ayuda a que la letra inicial de la columna que contiene el nombre de los países sea mayúscula
paises_filtrados <- mutate(paises_filtrados, 
                           Paises = str_to_title(paises_filtrados$Paises), 
                           Acumulados_por_millón = Total_de_casos * 1000000 /5 )

#Arrange
#Con esta función será posible organizar alguna o algunas de nuestras columnas contenidas en la base de datos de acuerdo a nuestras necesidades
#En este ejemplo, como puede observarse, la columna que contiene el total de casos será organizada de manera descendente, de tal manera que podamos apreciar y evaluar aquellos países que han reportado el mayor y el menor número de casos registrados en total
paises_filtrados <- arrange(paises_filtrados, desc(Total_de_casos))


# Pipes
#(de esta forma obtenemos el código de la función pipe (%>%), sin necesidad de teclarla cada uno de los signos que la componen)
# En Windows: crtl + shift + m 
# En Mac: Cmd + shift + m
#De acuerdo a un video en donde se explica la funcionalidad de los pipes, señala que dicha función hace posible expresar una secuencia de operaciones múltiples en una forma compacta y clara
#En este ejmplo, como se puede observar, introducimos las mismas funciones anteriormente ejecutadas, pero de una manera cronológica y estructurada
#Lo que quiere decir esta función es lo siguiente: crea una base de datos denominada países_filtrados_pipe utilizando los datos contenido en la base original denominada paises; posteriormente selecciona de todas las columnas únicamente las que contienen los nombres de los países, las fechas de reporte y los casos acumualdos.
#El siguiente paso consistirá en filtrar únicamente aquellos datos cuya fecha de reporte estén entre el 5 de noviembre y 5 de diciembre del 2020.
#Ahora, haciendo uso de la función rename, se cambiará el nombre de la columna Casos Acumulados para quedar como Total de casos
#Posteriormente, con la función mutate agregaremos una nueva variable utilizando como base un dataset existente; en este caso utilizando la base de datos denominada paises filtrados. Así, la nueva variable contendrá la operación asignada en el código; es decir, se tomarán los datos de la columna Total de casos se multuplicarán por un millón y finalmente se dividirán entre 5.
#Asimismo, con la función str_to_title nos ayuda a que la letra inicial de la columna que contiene el nombre de los países sea mayúscula.
#Finalmente, haciendo uso de la función arrange, se ordenarán los datos de la columna Total de casos de manera descendente.
paises_filtrados_pipe <- paises %>% 
  select(Fecha_de_reporte, Paises, Casos_Acumulados) %>% 
  filter(Fecha_de_reporte >" 2020-11-05" & Fecha_de_reporte < "2020-12-05" ) %>% 
  rename(Total_de_casos = Casos_Acumulados) %>% 
  mutate(Paises = str_to_title(paises_filtrados$Paises), 
         Acumulados_por_millón = Total_de_casos * 1000000 /5) %>% 
  arrange(desc(Total_de_casos))

