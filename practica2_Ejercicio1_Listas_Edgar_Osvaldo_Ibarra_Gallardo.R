##Practica 2 Vectores y listas

#Instrucciones
#Construir vectores
#Construir lista con vectores


##########################################
#Asignacionn de vectores
#Nombre de pelicula (char)
nombre_pelicula <- c("The Aspern Papers", "Sea Fever", "Diego Maradona", "The Godfather", "City of a Million Soldiers")
  
#Calificacion de peliculas (numerico)
#Se califica la pelicula en una escala del 1 al 10, donde el menor valor corresponde a una calificacion mala.
calificacion_pelicula <- c(2.3, 3.4, 8.6, 10, 5.4)
  
#Año de la pelicula (entero)
#Año en que se estreno la pelicula
estreno_pelicula <- c(2020L, 2018L, 2019L, 1988L, 2017L)

  
#Critica de pelicula (char)
#Comentario u opinion sobre la pelicula
critica_pelicula <- c("Critica, The Aspern Papers. La pelicula es una sucesion de flashbacks y momentos innecesariamente alargados y metidos con calzador, que no va a ninguna parte",
                      "Critica, Sea Fever. Una pena, porque tenia muchas expectativas en este anunciado punto y final de la serie, y me queda un sabor agridulce",
                      "Critica, Diego Maradona. Es regular, me decepciono",
                      "Critica, The Godfather, Es una buena pelicula si uno se propone verla sabiendo de antemano que no es una superproduccion",
                      "Critica, City of a Million Soldiers, Es una digna eleccion si no se tiene nada que ver y apetece algo de accion y suspense")
  
#Si te gusto o no la pelicula (T, F)
Gustos_pelicula <- c(FALSE, FALSE, TRUE, TRUE, FALSE)


########################################################

#Creacionn de lista
Lista_peliculas <- list(nombre_pelicula, calificacion_pelicula, estreno_pelicula, critica_pelicula, Gustos_pelicula)


#########################################################
#Creacion de Data Frame
data_frame_peliculas <- as.data.frame(Lista_peliculas)

#Funcion para renombrar columnas de variables 
colnames(data_frame_peliculas) <- c("Pelicula", "Ano", "Puntuacionn", "Like", "Critica")

#Funcion para exportar a Excel CSV
write.csv(data_frame_peliculas, "Peliculas_criticas.csv")

#Funcion para guardar en donde yo quiera
file.choose()

###########################################################


