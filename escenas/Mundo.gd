extends Node2D

var Carta = preload("res://escenas/Carta/Carta.tscn")

var valorPolitica = 0
var valorSalud = 0

var cartas = [] # Lista de cartas , esto es clave
var cartaActual = 0

func _ready():
	crear_tarjetas()
	actualizar_valores_en_UI()

# Funciones de configuración

func crear_tarjetas():
	cartas = Configuracion.obtener_tarjetas_random(3)
	var idCarta = 0
	for carta in cartas:
		idCarta += 1
		var instanciaCarta = Carta.instance()
		instanciaCarta.configurar(carta, idCarta)
		$Cartas.add_child(instanciaCarta)
	cartaActual = idCarta

func actualizar_valores_en_UI():
	$Textos/ValorPolitica.text =  str(valorPolitica)
	$Textos/ValorSalud.text =  str(valorSalud)

# Funciones que son acciones en el juego

func _on_BotonSi_button_down():
	get_tree().call_group("seleccion", "aceptar_tarjeta", cartaActual)
	cartaActual -= 1

func _on_BotonNo_button_down():
	get_tree().call_group("seleccion", "rechazar_tarjeta", cartaActual)
	cartaActual -= 1

# llamado desde el grupo "seleccion"
func aplicar_cambios(variaciones: Dictionary):
	print(valorPolitica, valorSalud)
	if variaciones.has("politica"):
		print("-> ", variaciones["politica"])
		valorPolitica += variaciones["politica"]
	if variaciones.has("salud"):
		print("-> ", variaciones["salud"])
		valorSalud += variaciones["salud"]
	actualizar_valores_en_UI()
