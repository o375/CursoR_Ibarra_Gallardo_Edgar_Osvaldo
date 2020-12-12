library(tidyverse)
library(gganimate)
library(gifski)
########################################################################

paises <- read.csv( "https://covid19.who.int/WHO-COVID-19-global-data.csv")

colnames(paises) <- c("Fecha_de_reporte",
                      "Código",
                      "Pais",
                      "Region",
                      "Nuevos_casos", 
                      "Casos_acumulados",
                      "Nuevas_defunciones",
                      "Defunciones_acumulados") 
str(paises)
summary(paises)

#Con esta función revisamos los valores o datos de una determinada columna
unique(paises$Region)

#Con la siguiente función comvertimos en factor cierta variable 
paises$Region <- as.factor (paises$Region)

paises$Region <- factor(paises$Region, 
                        levels = c("EMRO","EURO","AFRO","WPRO","AMRO","SEARO","Other"),
                        labels = c("Mediterraneo Oriental","Europa","Africa","Pacífico","América", "Sureste de Asia", "Otros"))

par(mfrow = c (1,1))
plot(paises$Region, main = "Regiones de la OMS", 
     xlab = "Regiones",
     ylab = "Frecuencias",
     col = "red")

boxplot(paises$Nuevos_casos ~ paises$Region)

##############################################################################

##Ddplyr
# Pipes (%>%)

paises_filtrado <- paises %>% 
  select(Fecha_de_reporte, Region, Nuevos_casos) %>% 
  filter(Fecha_de_reporte == "2020-08-29") %>% 
  arrange(Nuevos_casos)

###############################################################################

paises_filtrado <- paises %>% 
  group_by(Fecha_de_reporte, Region) %>% 
  summarise(Casos_totales = sum(Nuevos_casos))

#Función as.Date. Nos pide dos parámetros: la columa original y el formato que deseamos
#Con ello, estandarizamos la información para poder manipularma correctamente
paises_filtrado$Fecha_de_reporte <- as.Date(paises_filtrado$Fecha_de_reporte, format = "%Y-%m-%d")

#Debemos verificar ña clase de nuestros datos para asegurarnos que es posible trabajar con ellas
class(paises_filtrado$Fecha_de_reporte)
class(paises_filtrado$Region)
class(paises_filtrado$Casos_totales)

#Primero te pide el data set que quiero graficar y posteriormente se establece la aes, es decir, la estética del gráfico
#Generamos diagrama de caja
ggplot(paises_filtrado, 
       aes(x = Fecha_de_reporte, y = Casos_totales, fill = Region)) +
  geom_boxplot()

#Generamos ahora diagrama de lineas. Para ello sólo copiamos el codigo anterior y camboamps boxplot por line

ggplot(paises_filtrado, 
       aes(x = Fecha_de_reporte, y = Casos_totales, col = Region)) +
  geom_line() + 
  geom_point() +
  transition_reveal(Fecha_de_reporte) +
  theme_classic()

