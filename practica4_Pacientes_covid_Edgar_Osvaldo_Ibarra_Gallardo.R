##Pr�ctica 4

#Diabetes, Hipertensi�n, Obesidad, Adultomayor
#Diabetes, Hipertensi�n, Obesidad, Adultomayor 
#Como primer paso se asignan los nombres de los vectores. Es importante dejar dichos vectores sin datos, pues posteriormente asignaremos dichos valores en funci�n de cada paciente 

nombre_paciente <- c()
edad_paciente <- c()
sexo_paciente <- c()

paciente_diabetico <- c()
paciente_hipertenso <- c()
paciente_obesidad <- c()

paciente_temperatura <- c()
paciente_dolor_cabeza <- c()
paciente_dolor_torax <- c()
paciente_dif_respiratoria <- c()

#Ciclo iterativo para cinco pacientes
#El segundo paso consiste en asignar el iterador para nuestra funci�n. Para este caso que es un ejemplo solo se itera una sola vez. 
#Asimismo se deber� asignar la pregunta u oraci�n que se desea establecer

for (i in 1:1) {

#Recolecci�n de datos para pacientes
  nombre_paciente[i] <- readline(prompt = "Nombre del paciente:")
  edad_paciente[i] <- readline(prompt = "Edad del paciente:")
  sexo_paciente [i] <- readline(prompt = "Sexo del paciente:")
  
  paciente_diabetico[i] <- readline(prompt = "�Paciente es diab�tico? (S/N):")
  paciente_hipertenso[i] <- readline(prompt = "�Paciente es hipertenso? (S/N):")
  paciente_obesidad[i] <- readline(prompt = "�Paciente es obeso? (S/N):")
  
  paciente_temperatura[i] <- readline(prompt = "�Cu�l es la temperatura del paciente?:")
  paciente_dolor_cabeza[i]<- readline(prompt = "�El paciente tiene dolor de cabeza?:")
  paciente_dolor_torax[i] <- readline(prompt = "�El paciente presenta dolor en el torax?:")
  paciente_dif_respiratoria[i] <- readline(prompt = "El paciente presenta deficiencia respiratoria?:")
  
#Analizamos al paciente
#Una vez asignadas las funciones y los preguntas, asignamos las condicionales necesarias de acuerdo a los datas que se requieren. 
#Es nuestro ejemplo se establece lo siguiente: si el paciente tiene m�s de 60 a�os, print "El paciente tiene probabilidad de complicaciones". 
#Si adem�s de la condici�n anterior, el paciente tiene temperatura mayor de 38.5, o bien el paciente tiene dolor de torax, print "trasladar al hospital". 
#Si adem�s de las anteriores condiciones el paciente es diab�tico o hipertenso, print, "paciente con morbilidad, trasladar urgentemente". 
#Finalmente, si adem�s de todo lo anterior el paciente tiene deficiencia respiratoria, print, "suministrar ox�geno urgentemente". 
#Por el contrario, si ninguna de las condiciones se cumple, print "Paciente menor de 60 a�os, con menor probabilidad de complicaciones".
  
  
  if (edad_paciente > 60){
    print("El paciente tiene probabilidad de complicaci�n")
    
    if(paciente_temperatura > 38.5 | paciente_dolor_torax == "S")
      print("paciente con fiebre, trasladar a hospital")
      
      if (paciente_diabetico =="S" | paciente_hipertenso == "S")
        print("paciente con morbilidad, trasladar urgentemente")
    
        if(paciente_dif_respiratoria =="S"){
          print("suministrar oxigeno urgentemente")
        }
    
  }else{
    print("Paciente menor de 60 a�os, con menor probabilidad de complicaciones")
    
  }    
          
  }
  
#Cabe se�alar que una vez que se ejecuta el c�digo anterior, solo resta contestar cada una de las preguntas formuladas, y el programa responder� con base en las respuestas si las condiciones se cumplen.