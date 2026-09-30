Algoritmo RuletaDeDecisiones
	
	Definir cantidad, i, posicion, cantidadResultados, opcion Como Entero
	Definir elemento Como Caracter
	Definir continuar Como Logico
	Definir elementos, resultados Como Caracter
	
	Escribir "========== if{Spin} =========="
	Escribir "¿Cuántos elementos deseas ingresar?"
	Leer cantidad
	
	Dimension elementos[cantidad]
	Dimension resultados[cantidad]
	
	// Registrar elementos
	Para i <- 1 Hasta cantidad Hacer
		Escribir "Ingresa el elemento ", i, ":"
		Leer elementos[i]
	FinPara
	
	cantidadResultados <- 0
	continuar <- Verdadero
	
	// Girar ruleta
	Mientras continuar = Verdadero Y cantidad > 0 Hacer
		
		Escribir ""
		Escribir "Presiona ENTER para girar la ruleta..."
		Esperar Tecla
		
		// Seleccionar aleatorio
		posicion <- Aleatorio(1, cantidad)
		
		// Guardar elemento
		elemento <- elementos[posicion]
		
		cantidadResultados <- cantidadResultados + 1
		resultados[cantidadResultados] <- elemento
		
		Escribir ""
		Escribir "La ruleta seleccionó: ", elemento
		
		// Eliminar elemento 
		Si posicion < cantidad Entonces
			
			i <- posicion
			
			Mientras i < cantidad Hacer
				elementos[i] <- elementos[i + 1]
				i <- i + 1
			FinMientras
			
		FinSi
		
		cantidad <- cantidad - 1
		// Realizar otro giro
		Si cantidad > 0 Entonces
			
			Escribir ""
			Escribir "¿Qué deseas hacer?"
			Escribir "1. Girar nuevamente"
			Escribir "2. Detener"
			Leer opcion
			
			Si opcion = 2 Entonces
				continuar <- Falso
			FinSi
			
		SiNo
			
			Escribir ""
			Escribir "Ya no quedan elementos disponibles."
			continuar <- Falso
			
		FinSi
		
	FinMientras
	
	// Mostrar resultados
	Escribir ""
	Escribir "========== RESULTADOS =========="
	
	Para i <- 1 Hasta cantidadResultados Hacer
		Escribir i, ". ", resultados[i]
	FinPara
	
FinAlgoritmo
	
	