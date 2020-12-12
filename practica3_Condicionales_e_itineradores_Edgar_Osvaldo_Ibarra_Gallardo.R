##Practica de condicionales e itineradores

#Forma básica de IF (si, algo) - else (de lo contrario haz otra cosa)
#Con esta condicional se nos permite establecer condicionales para arrojar determinado resultado en función de lo que se establezca en dichas condicionales 
if(4 > 5){
  print("si, es verdadero")
}else{
  print("no, no es verdadero")
  
}
  
#Condicion que depende de dos variables
#Cabe señalar que es posible establecer condicionales a partir de los valores asignados a los vectores, tal como se muestra a continuación:

numero1 <- 15
numero2 <- 20

if(numero1 > 20){
  print("es verdadero")
  
}else{
  print("es falso")

}

#Condicion de tres variables
numero3 <- 5

# Ambersand (&) me asegura que la condicion sea obligada; es decir las dos condiciones se deben cumplir

if(numero2 > numero1 & numero3 < numero2) { 
  print("es verdadero")
}else{ print("es falso")
}

  
# Pipe (|) me asegura que la condicion no sea obligada; es decirse debe cumplir por lo menos una condicion

numero3 <- 5
if(numero2 > numero1 & numero3 < numero2) {
    print("es verdadero")
    
}else{
  print("es falso")
}
    
#################

#Ciclo de control (For)
  #Con esta herramienta se nos permite iterar o repetir una función o un valor determinado número de veces.

vector_numeros <- c()
for (iterador in 5:500) {
  print(paste("base",iterador))
  
}


  
  
