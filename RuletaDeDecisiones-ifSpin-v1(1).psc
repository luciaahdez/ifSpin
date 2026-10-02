Algoritmo RuletaDeDecisiones
	
	Definir cantidad, i, indiceAleatorio, cantidadResultados, opcion Como Entero
	Definir elemento Como Caracter
	Definir continuar Como Logico
	Definir elementos, resultados Como Caracter
	Definir comando, comandoMinus Como Texto
	Definir EsperarTecla Como Caracter
	Definir ejecutarPrograma Como Logico
	Definir se_repite Como Logico
	
	ejecutarPrograma <- Verdadero
	
	Dimension elementos[500]
	Dimension resultados[500]
	cantidadResultados <- 0
	cantidad <- 0 // Usaremos esta variable única para saber cuántos elementos hay guardados
	
	Mientras ejecutarPrograma = Verdadero Hacer
		Escribir "========================================="
		Escribir "      ========== if{Spin} ===========    "
		Escribir "========================================="
		Escribir "Comandos disponibles:"
		Escribir " - Escriba DATOS para ingresar datos para el sorteo"
		Escribir " - Escriba GIRAR para el sorteo"
		Escribir " - Escriba SALIR para cancelar y salir"
		Escribir " - Escriba PARA para mostrar a los ganadores"
		Escribir "----------------------------------------="
		Escribir "Ingrese comando:"
		Leer comando
		
		comandoMinus <- Minusculas(comando)
		Limpiar Pantalla
		
		Si comandoMinus = "salir" Entonces
			ejecutarPrograma <- Falso
			Si cantidadResultados = 0 Entonces
				Escribir "Todavía no empieza el sorteo."
			SiNo
				Escribir "========== RESULTADOS FINAL =========="
				Para i <- 1 Hasta cantidadResultados Hacer
					Escribir i, ". ", resultados[i]
				FinPara
			FinSi
			Escribir "Presione ENTER para salir..."
			Leer EsperarTecla
			
		SiNo
			Si comandoMinus = "para" Entonces
				Si cantidadResultados > 0 Entonces
					Escribir "Sorteo finalizado. Realizó: ", cantidadResultados, " Sorteos"
					Escribir "========== RESULTADOS =========="
					Para i <- 1 Hasta cantidadResultados Hacer
						Escribir i, ". ", resultados[i]
					FinPara
				SiNo
					Escribir "No realizó ningún sorteo."
				FinSi
				Escribir "Presione ENTER para continuar..."
				Leer EsperarTecla
				Limpiar Pantalla
				
			SiNo
				Si comandoMinus = "datos" Entonces
					Escribir "Ingrese los nombres (Deje en blanco y presione ENTER para terminar):"
					cantidad <- 0
					Repetir
						Leer elemento
						Si elemento <> "" Entonces
							// Validar que no se repita en la lista
							se_repite <- Falso
							Si cantidad > 0 Entonces
								Para i <- 1 Hasta cantidad Hacer
									Si elementos[i] = elemento Entonces
										se_repite <- Verdadero
									FinSi
								FinPara	
							FinSi
							
							Si se_repite = Verdadero Entonces
								Escribir "Ese nombre ya está en la lista. Ingrese otro:"
							SiNo
								cantidad <- cantidad + 1
								elementos[cantidad] <- elemento
							FinSi
						FinSi
					Hasta Que elemento = ""
					
					Escribir "Datos guardados. Total elementos en la ruleta: ", cantidad
					Escribir "Presione ENTER para continuar..."
					Leer EsperarTecla
					Limpiar Pantalla
					
				SiNo
					Si comandoMinus = "girar" Entonces
						// Validación de ruleta vacía (Lo que necesitabas)
						Si cantidad = 0 Entonces
							Escribir "Error: La ruleta está vacía. Ingrese DATOS primero."
							Escribir "Presione ENTER para continuar..."
							Leer EsperarTecla
							Limpiar Pantalla
						SiNo
							continuar <- Verdadero
							Mientras continuar = Verdadero Y cantidad > 0 Hacer	
								Escribir "Presiona ENTER para girar la ruleta..."
								Esperar Tecla
								
								// Seleccionar un índice aleatorio basado en los elementos que quedan
								indiceAleatorio <- Aleatorio(1, cantidad)
								elemento <- elementos[indiceAleatorio]
								
								// Guardar en el historial de ganadores
								cantidadResultados <- cantidadResultados + 1
								resultados[cantidadResultados] <- elemento
								
								Escribir ""
								Escribir "¡La ruleta seleccionó: ", elemento, "!"
								
								// Eliminar el elemento del arreglo para no repetirlo cambiando posiciones
								Si indiceAleatorio < cantidad Entonces
									Para i <- indiceAleatorio Hasta cantidad - 1 Hacer
										elementos[i] <- elementos[i + 1]
									FinPara	
								FinSi
								cantidad <- cantidad - 1 // Ahora hay un elemento menos libre
								
								// Verificar si aún se puede seguir girando
								Si cantidad > 0 Entonces
									Escribir ""
									Escribir "¿Qué deseas hacer?"
									Escribir "1. Girar nuevamente"
									Escribir "2. Detener"
									Leer opcion
									Si opcion = 2 Entonces
										continuar <- Falso
									FinSi
									Limpiar Pantalla
								SiNo
									Escribir ""
									Escribir "Ya no quedan más elementos en la ruleta."
									continuar <- Falso
									Escribir "Presione ENTER para continuar..."
									Leer EsperarTecla
									Limpiar Pantalla
								FinSi
							FinMientras
						FinSi
					SiNo
						Escribir "Comando no reconocido. Intente de nuevo."
						Escribir "Presione ENTER para continuar..."
						Leer EsperarTecla
						Limpiar Pantalla
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
	
FinAlgoritmo