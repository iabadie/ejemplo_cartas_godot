extends Node

# Estructura de datos de tarjeta:

#  titulo
#  descripcion
#  aceptar -> incluye info como varía política y salud 
#  rechazar -> incluye info como varía política y salud 

var tarjetas = [
	{
		"titulo": "Super política",
		"descripcion": "Tarjeta que aumenta política a costa de salud, o reduce politica sin perder salud",
		"aceptar": {
			"politica": 10,
			"salud": -2
		},
		"rechazar": {
			"politica": -2,
			"salud": 0
		}
	},
	{
		"titulo": "Gran hospital",
		"descripcion": "Gran salud pero eprdidas en política, no penaliza el rechazo",
		"aceptar": {
			"politica": -5,
			"salud": 10
		},
		"rechazar": {
			"politica": 0,
			"salud": 0
		}
	},
	{
		"titulo": "Copia Gran hospital",
		"descripcion": "Copia - Gran salud pero eprdidas en política, no penaliza el rechazo",
		"aceptar": {
			"politica": -5,
			"salud": 10
		},
		"rechazar": {
			"politica": 0,
			"salud": 0
		}
	},
	{
		"titulo": "Copia Super política",
		"descripcion": "Copia - Tarjeta que aumenta política a costa de salud, o reduce politica sin perder salud",
		"aceptar": {
			"politica": 10,
			"salud": -2
		},
		"rechazar": {
			"politica": -2,
			"salud": 0
		}
	},
]

# Lógica para obtener tarjetas de forma aleatoria
func obtener_tarjetas_random(cantidad):
	randomize()
	var indicesUsados = [] # Cada vez que elijo una tarjeta, guardo el indice de esa tarjeta en esta lista
	var tarjetasElegidas = [] # Cada vez que elija una tarjeta random, la guardo en esta lista
	for iteracion in range(0, cantidad):
		var indice = randi() % tarjetas.size()
		while indicesUsados.find(indice) != -1:
			indice = randi() % tarjetas.size()
		tarjetasElegidas.append(tarjetas[indice])
		indicesUsados.append(indice)
	return tarjetasElegidas # Al finalizar devuelve las tarjetas elegidas aleatoriamente
