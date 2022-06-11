extends Node


func convertir_number_a_string(numero):
	return String(numero)

## Esta función recibe un número menor a 100 y lo devuelve
## Como string en formato XX  completando con 0 en la decena
func formatear_timer(tiempo):
	if (tiempo < 10):
		return "0" + String(tiempo)
	else:
		return String(tiempo)

## Esta función recibe la fuerza actual del personaje
## Y el nivel del arma que se quiere equipar.
## Si la fuerza no es el doble del nivel del arma
## devolverá falso, sino devolverá verdadero
func validar_atributo(fuerza, nivelArma):
	if fuerza >= (nivelArma * 2):
		return true
	else:
		return false
		
# El daño final es calculado en base al daño recibido - la defensa.
# Si el daño fue con golpe crítico, el resultado aumenta un 50%
func calcular_danio(recibido: int, defensa: int, critico: bool):
	var danio = recibido - defensa
	if critico:
		return danio * 1.5
	else:
		return danio
		
## Esta función recibe una lista de enteros correspondiente al precio de
## Productos que se van a comprar en el juego y devuelve el valor
## Total de la suma de los productos o 0 si no hay productos
## Ejemplo calcular_precio([100, 50, 20]) -> 170
func calcular_precio(listaDePrecios: Array):
	var precioTotal = 0;
	for precio in listaDePrecios:
		precioTotal += precio
	return precioTotal;

## Esta función recibe un String representando el "Lugar" en donde un
## personaje recibe el golpe y dependiendo de dicho lugar devolverá
## un valor de multiplicador de daño mayor a 1 o 1 si el lugar no es crítico
## Los lugares críticos son la "cabeza", "espalda" y "tobillo".
## La función no distingue entre mayusculas y minúsculas.
## Ej:  multiplicador_por_golpe_en_parte_critica("CABEZA") -> 2
## Ej:  multiplicador_por_golpe_en_parte_critica("Tobillo") -> 1.1
## Ej:  multiplicador_por_golpe_en_parte_critica("torso") -> 1
func multiplicador_por_golpe_en_parte_critica(lugar: String):
	lugar = lugar.to_lower()
	if lugar == "cabeza":
		return 2
	if lugar == "espalda":
		return 1.5
	if lugar == "tobillo":
		return 1.1
	return 1
	

## Función que calcual si el personaje puede realizar o no un salto
## estaEnPiso indica si el eprsonaje está tocando el piso
## puedeMoverse indica si el personaje puede relaizar alguna accion
## cuentaDeSaltos indica la cantidad de saltos que lleva realizados
## Si el personaje no "puedeMoverse" no deberá poder saltar
## Si el personaje está en el piso o la cuenta de saltos es menor a 2 deberá poder saltar
func puede_saltar(estaEnPiso, puedeMoverse, cuentaDeSaltos):
	if not puedeMoverse:
		return false
	if estaEnPiso:
		return true
	elif cuentaDeSaltos < 2:
		return true
	else:
		return false

## Función que devuelve el nro de puntos de vida del personaje luego de beber una poción de cura
## La saludActual indica la cantidad de puntos actuales del personaje
## puntosDeCura indican cuantos puntos puede curar la poción tomada
## La saludMaxima es la máxima salud que puede tener el personaje
## La fución devolverá el total de puntos finales que tiene el jugador
## o el máximo de salud, en caso de que los puntos curados resultantes sean mayores a su salud máxima.
func recuperar_salud(saludMaxima, saludActual, puntosDeCura):
	var saludResultante = saludActual + puntosDeCura
	if saludResultante > saludMaxima:
		saludResultante = saludMaxima
	return saludResultante
