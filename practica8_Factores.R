##Práctica 8. Factores

#Cargamos nuestra base de datos
bikes <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/bikes.csv")

str(bikes)
summary(bikes)

#Función para ver los valores de una columa
unique(bikes$season)

#Trabajamos connvsersiones de datos de caracteres a factores
bikes$season <- factor(bikes$season, levels = c(1,2,3,4), labels = c("Invierno", "Primavera", "Verano", "Otoño")) 

bikes$workingday <- factor(bikes$workingday,
                           levels = c (0,1),
                           labels = c ("No_laboral", "laboral"))

bikes$weathersit <- factor(bikes$weathersit, 
                           levels = c (1,2,3),
                           labels = c ("Despejado", "Nublado", "Lluvioso"))

#Vector para colorear cada una de las barras del gráfico
colores <- c ("blue", "green", "yellow", "orange")

#Sirve para mostrar un conjunto de gráficas en el apartado de Plots
par(mfrow = c(1,1))

#Categorías. Generamos un plot con las categorías del año. la función "main" sirve para nombrar el gráfico. Por su parte, las funciones xlab y ylab sirven para nombrar el eje de las "x" y de las "y", respectivamente.
#Finalmente, la función col sirve para asignar el colo de nuestro gráfico. 

plot(bikes$season, main = "Categorias de las estaciones del año", xlab = "Climas", ylab ="Frecuencias",
     col = colores)

plot(bikes$workingday, main = "Categorias de los días laborales del año", xlab = "Temporadas", ylab ="Frecuencias",
     col = colores)

plot(bikes$weathersit, main = "Categorias de las estaciones del año", xlab = "Temporadas", ylab ="Frecuencias",
     col = colores)                    

#Funciones para realizar subconjunto de datos

#La función subset es similar a la función split. Subset significa subconjunto de datos 

invierno <- subset(bikes, season == "Invierno")$cnt
primavera <- subset(bikes, season == "Primavera")$cnt
verano <- subset(bikes, season == "Verano")$cnt
otoño <- subset(bikes, season == "Otoño")$cnt

#Con esta función corrobora si es o no vector. 
is.vector (Invierno)

par(mfrow = c(2,2))

#Histograma grafica valores cuantitativos
hist(invierno, main = "Histograma de bicicletas en invierno", 
     xlab = "Invierno", 
     ylab = "Frecuencia", 
     col = "blue", prob =T) 
lines(density(primavera))
abline( v = mean(primavera), col = "black") 
abline( v = median (primavera), col = "white")


hist(verano, main = "Histograma de bicicletas en verano", 
     xlab = "Verano", 
     ylab = "Frecuencia", 
     col = "yellow", 
     prob =T)
lines(density(verano))
abline( v = mean(verano), col = "black") 
abline( v = median (verano), col = "white")


hist(otoño, main = "Histograma de bicicletas en otoño", 
     xlab = "Otoño", 
     ylab = "Frecuencia", 
     col = "orange", 
     prob =T)
lines(density(otoño))
abline( v = mean(otoño), col = "black") 
abline( v = median (otoño), col = "white")

hist(primavera, main = "Histograma de bicicletas en primavera", 
     xlab = "Primavera", 
     ylab = "Frecuencia", 
     col = "green", 
     prob =T)
lines(density(primavera))
abline( v = mean(primavera), col = "black") 
abline( v = median (primavera), col = "white")



