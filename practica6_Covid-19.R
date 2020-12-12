#El siguiente link contiene información reportada con relación a la COVID-19 de cada uno de los países. A esta base la denominamos "países". 
paises <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")

#Estructura de la data set
#Con esta funcion observamos la estructura general de la data set

str(paises) 

paises$Country

str(paises$ï..Date_reported)

#Esta funcion muestra un resumen de los datos; es decir, se muestran datos referentes a determinada columna de la base de datos, e incluso del total de la base completa

summary(paises)

summary(paises$Cumulative_cases)


#Revisamos la longitud (totalidad) de paises contenidos en la dataset

total_paises <- length(unique(paises$Country))
print(paste("tenemos un total", total_paises, "paises"))


#Revisamos columnas de nuestro data set
#Es importante revisar nuestras columnas, pues para posteriores funciones y análisis será importante identificar cada columna

colnames(paises)

colnames(paises) <- c("Fecha_de_reporte", 
                      "Codigo_de_pais", 
                      "Paises", 
                      "Region_OMS", 
                      "Casos_nuevos", 
                      "Casos_acumulados",
                      "Nuevas_defunciones", 
                      "Defunciones_acumuladas")


##Cortamos el dataset en funcion de la variable que necesitemos
#Esto es útil para analizar determinadas variables contenidas en nuestra dataset

paises_filtrados <- split(paises, paises$Paises)
fechas_filtrados <- split(paises, paises$Fecha_de_reporte)
regiones_filtrados <- split(paises, paises$Region_OMS)


##############################################################################
#Desintegrar el dataset original.
#Lappy se aplica a una funcion para cada elemento de la lista para enviar una de las listas a un archivo de escritura dataframe
#Con ello, en la carpeta que nostros determinemos, se podrá observar sólo aquella informacion o columna que hayamos especificado en la funcion
#Para este ejemplo enviamos a una carpeta específica de nuestro escritorio, la cual denominamos "BASES", únicamente los datos contenidos en las columnas paises, fechas y regiones

lapply(names(paises_filtrados),
       function(x){write.csv(paises_filtrados[[x]], paste0("BASES/paises/",x,".csv"),
                             row.names = FALSE)}) 

lapply(names(fechas_filtrados),
       function(x){write.csv(fechas_filtrados[[x]], paste0("BASES/Fechas/",x,".csv"),
                             row.names = FALSE)}) 

lapply(names(regiones_filtrados),
       function(x){write.csv(regiones_filtrados[[x]], paste0("BASES/Regiones/",x,".csv"),
                             row.names = FALSE)}) 

##############################################################################

#Integrar el dataset
#Buscamos los patrones que se repiten dentro de las carpetas
#A pesar de que hasta ahora nos hemos encargado de dividir o seccionar nuestra base original, es posible reintegrarla uniendo cada uno de sus componentes

patrones_paises_csv <- list.files("BASES/paises/", pattern = "*.csv")
patrones_regiones_csv <- list.files("BASES/Regiones/", pattern = "*.csv")
patrones_fechas_csv <- list.files("BASES/Fechas/", pattern = "*.csv")

library(plyr)

integrar_fechas <- ldply (paste0("BASES/Fechas/", patrones_fechas_csv), read.csv)
integrar_regiones <- ldply (paste0("BASES/Regiones/", patrones_fechas_csv), read.csv)
integrar_paises <- ldply (paste0("BASES/paises/", patrones_fechas_csv), read.csv)
