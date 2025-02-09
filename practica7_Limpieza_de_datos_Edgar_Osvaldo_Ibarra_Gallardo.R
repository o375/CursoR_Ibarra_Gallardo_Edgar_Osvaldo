library(tidyverse)

library(dplyr)

paises <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")

colnames(paises) <- c("Fecha_de_reporte", 
                      "C�digo_de_pa�s", 
                      "Paises", "Regi�n_OMS" ,
                      "Casos_Nuevos", 
                      "Casos_Acumulados", 
                      "Defunciones_Nuevas", 
                      "Defunciones_Acumuladas")


#Con la siguiente funci�n es posible estandarizar las fechas de nuestra dataset
#Como se puede observar al final de la funci�n, para este ejemplo estandarizamos la fecha con base en el formato YEAR/MONTH/DAY
paises$Fecha_de_reporte <- as.Date(paises$Fecha_de_reporte, format = "%Y-%m-%d" )

#Funciones de uso frecuente

#Select
#Esta funci�n nos permite seleccionar �nicamente aquellas variables o columnas de nuestra dataset
#Para este ejemplo, �nicamente seleccionamos las columnas que contienen los datos relacionados con los nombres de los pa�ses, las fechas de reportes y los casos acumulados
paises_filtrados <- select(paises, Fecha_de_reporte, Paises, Casos_Acumulados )

#Filter
#Al ejecutar esta funci�n podemos observar que nuestra base de datos denominada paises_filtrados contendr� �nicamente aquellos datos cuya fecha de reporte est�n entre el 5 de noviembre y 5 de diciembre del 2020)
#Con ello, ser� posible analizar u observar �nicamente aquellos datos que por el momento son requeridos
paises_filtrados <- filter(paises_filtrados, Fecha_de_reporte >" 2020-11-05" & Fecha_de_reporte < "2020-12-05")

#Rename
#Al ejecutar esta funci�n, como puede observarse, la columa que anteriormente se denominaba "Casos_Acumulados" ha pasado a denominarse como "Total_de_casos" 
#Lo anterior ser� �til, pues a medida que vamos seleccionando y filtrando nuestra base de datos con las funciones anteriores, puede que requiramos renombrar nuestras variables o columnas
paises_filtrados <- rename(paises_filtrados, Total_de_casos = Casos_Acumulados)

#Mutate
#Al ejecutar esta funci�n podemos observar en nuestra base pa�ses_filtrados una nueva columna; es decir, con la funci�n mutate agregaremos una nueva variable utilizando como base un dataset existente. 
#Para este ejemplo la nueva variable o columna utilizar� los datos contenidos en la columna Total de casos, multiplicar� cada dato por un mill�n y a su vez lo dividir� entre en 5. El resultadp de esa operaci�n ser� lo que contendr� la nueva columna
#Asimismo, cabe notar que la funci�n str_to_title nos ayuda a que la letra inicial de la columna que contiene el nombre de los pa�ses sea may�scula
paises_filtrados <- mutate(paises_filtrados, 
                           Paises = str_to_title(paises_filtrados$Paises), 
                           Acumulados_por_mill�n = Total_de_casos * 1000000 /5 )

#Arrange
#Con esta funci�n ser� posible organizar alguna o algunas de nuestras columnas contenidas en la base de datos de acuerdo a nuestras necesidades
#En este ejemplo, como puede observarse, la columna que contiene el total de casos ser� organizada de manera descendente, de tal manera que podamos apreciar y evaluar aquellos pa�ses que han reportado el mayor y el menor n�mero de casos registrados en total
paises_filtrados <- arrange(paises_filtrados, desc(Total_de_casos))


# Pipes
#(de esta forma obtenemos el c�digo de la funci�n pipe (%>%), sin necesidad de teclarla cada uno de los signos que la componen)
# En Windows: crtl + shift + m 
# En Mac: Cmd + shift + m
#De acuerdo a un video en donde se explica la funcionalidad de los pipes, se�ala que dicha funci�n hace posible expresar una secuencia de operaciones m�ltiples en una forma compacta y clara
#En este ejmplo, como se puede observar, introducimos las mismas funciones anteriormente ejecutadas, pero de una manera cronol�gica y estructurada
#Lo que quiere decir esta funci�n es lo siguiente: crea una base de datos denominada pa�ses_filtrados_pipe utilizando los datos contenido en la base original denominada paises; posteriormente selecciona de todas las columnas �nicamente las que contienen los nombres de los pa�ses, las fechas de reporte y los casos acumualdos.
#El siguiente paso consistir� en filtrar �nicamente aquellos datos cuya fecha de reporte est�n entre el 5 de noviembre y 5 de diciembre del 2020.
#Ahora, haciendo uso de la funci�n rename, se cambiar� el nombre de la columna Casos Acumulados para quedar como Total de casos
#Posteriormente, con la funci�n mutate agregaremos una nueva variable utilizando como base un dataset existente; en este caso utilizando la base de datos denominada paises filtrados. As�, la nueva variable contendr� la operaci�n asignada en el c�digo; es decir, se tomar�n los datos de la columna Total de casos se multuplicar�n por un mill�n y finalmente se dividir�n entre 5.
#Asimismo, con la funci�n str_to_title nos ayuda a que la letra inicial de la columna que contiene el nombre de los pa�ses sea may�scula.
#Finalmente, haciendo uso de la funci�n arrange, se ordenar�n los datos de la columna Total de casos de manera descendente.
paises_filtrados_pipe <- paises %>% 
  select(Fecha_de_reporte, Paises, Casos_Acumulados) %>% 
  filter(Fecha_de_reporte >" 2020-11-05" & Fecha_de_reporte < "2020-12-05" ) %>% 
  rename(Total_de_casos = Casos_Acumulados) %>% 
  mutate(Paises = str_to_title(paises_filtrados$Paises), 
         Acumulados_por_mill�n = Total_de_casos * 1000000 /5) %>% 
  arrange(desc(Total_de_casos))

