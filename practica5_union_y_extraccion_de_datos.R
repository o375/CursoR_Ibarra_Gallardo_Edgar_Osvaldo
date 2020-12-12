library(plyr)

#El primer paso consiste en asignar los valores o datos a cada una de las variables.
nombre_paciente <- c("OSVALDO", "MARÍA", "JUAN", "FERNANADA", "JORGE")
edad_paciente <- c(33,65,34,76,75)
sexo_paciente <- c("S","S","N","N","S")

paciente_diabetico <- c ("S","S","N","N","S")
paciente_hipertenso <- c ("S","S","N","N","S")
paciente_obesidad <- c("S","S","N","N","S")

#Posteriormente conjuntamos los anteriores vectores en una lista, pues cabe recordar que la lista puede contener datos de diferentes variables.
pacientes <- list(nombre_paciente, edad_paciente, sexo_paciente, paciente_diabetico, paciente_hipertenso, paciente_obesidad)

#Una vez hecho lo anterior, transformamos la lista en un data frame con la siguiente función:
pacientes <- as.data.frame(pacientes)

#En caso de necesitar renombrar las columnas de las variables, utilizamos la siguiente función:
colnames(pacientes) <- c("Nombre Paciente", "Edad Paciente", "Sexo Paciente", "Paciente Diabetes", "paciente hipertension", "Paciente Obesidad")

#Finalmente podemos exportar los datos contenidos en el data frame a un archivo CSV.
write.csv(pacientes, "Base1.csv", row.names = F)

################################################################################

#Extraccion de bases de datos manuales (se cargan desde la web de Github)
#No es necesario descargar las bases de datos, sino únicamente copiar y pegar el link de donde se encuentran dichas bases, tal como se muestra a continuación:
base1 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base1.csv")
base2 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base2.csv")
base3 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base3.csv")
base4 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base4.csv")
base5 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base5.csv")

#Crear una lista de DataFrames
#Una vez hecho lo anterior, podemos compilar en una lista las bases de datos contenidas en los links anteriores.
Bases_lista <- list(base1, base2, base3, base4, base5)

#Lo siguiente por es hacer es:
#Crear una DataFrame con las listas (plyr) (Tidyverse -dplyr) y
#Unificar bases de datos con la siguiente función:

pacientes_dataframe <- rbind.fill(Bases_lista)

###############################################################################

##Funciones
#Funciones para realizar operaciones

resultados[i] <- resultados (i,4)

resultados <- function(numero1, numero2){
  
  suma <- numero1+numero2
  resta <- numero1-numero2
  multiplicación <- numero1*numero2
  division <- numero1/numero2
  
  resultados <- list (suma,resta,multiplicación,division)
  return(resultados)
}


lista <- function(base){
  bases <- c()
  for(i in 1:5){
    bases[i] <- read.csv()
    
  }
}

#Con lo anterior podremos obtener los resultados de las operaciones asignadas en nuestra función, obteniéndo una lista con los resultados de dichas operaciones.

###############################################################################

#Obtenemos masivamente las bases de datos
#Creamos una nueva función para extraer bases, la cual debe almacernarse en el mismo directorio

#Funcion para extraer bases

source("función_Extraccion.r")
extraccion_De_bases <- extraccion_De_bases()

#Posteriormente con la siguiente función será posible iterar las bases de datos obtenidas de los links 

base_De_bases <- list()

for (i in 1:5) {
  
  bases[[i]] <- read.csv(paste0("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base", "1",".csv"))
  
  print(paste0("https//raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base", "1",".csv"))
}


lista <- function(base){
  bases <- c()
  for (i in 1:5) {
    bases[[i]] - read.csv(paste0())
    print(paste0())
    
  }
  return(bases)
}

