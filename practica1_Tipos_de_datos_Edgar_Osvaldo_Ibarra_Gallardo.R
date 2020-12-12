##PRACTICA 1

#Tipos de variables (atomicas)

#Char
#Para asignar valores a una variable debemos asiganrle un nombre;en el caso del ejemplo la variable se llama "variable_char". 
#Posteriormente señalamos el valor asignado a la variable con la figura <- o bien con el signo =. Y finalmente asignamos el valor
variable_char <- "a"

#Funcion para comprobar que tipo de dato tenemos
class(variable_logica)

#Tipo dato numerico
#Cabe mencionar que las variables numéricas necesariamente incluirán valores decimales. Por ello, auque asignemos un valor sin decimales, el programa lo considerará como un valor decimal.
Variabale_numerica (5.56)

#Tipo de dato entero
#Para convertir este numero en entero, le agregamos "L"
#Debido a que las variables numéricas necesariamente incluyen valores decimales, para determinar valores enteros deberemos escribir una "L" al final del valor asignado para hacerle saber a R que queremos asignar un valor entero.
variable_entera  (10L)

#Tipo de variable logica
#Este tipo de variable permite determinar si nuestra función es falsa o verdadera.
variable_logica (FALSE)

#Funcion llamada Vector
#Esta limitado a almacenar tipos iguales. No puedes meter diferentes tipos de variables.

variables_caracteres <- c ("a", "b", "c", "d", "e")

variables_numericas <- c (5.88, 32.99, 6.55, 53.66, 21.43)

variables_logicas <- c (TRUE, FALSE, FALSE, FALSE, TRUE, TRUE)

variables_enteras <- c (10L, 19L, 12L, 19L, 18L)

#Almacenar vectores y valores de diferentes datos
#La lista puede almacenar de diferentes datos o vectores 

variables_enlistadas <- list(variables_caracteres, variables_logicas, variables_numericas)


  





