extends Node2D

var valoresAceptar
var valoresRechazar
var titulo = ""
var descripcion = ""
var id = 0

func configurar(datosCarta: Dictionary, idCarta: int):
	id = idCarta
	valoresAceptar = datosCarta["aceptar"]
	valoresRechazar = datosCarta["rechazar"]
	titulo = datosCarta["titulo"]
	descripcion = datosCarta["descripcion"]
	$Fondo/Descripcion.text = descripcion
	$Fondo/Title.text = titulo
	
func aceptar_tarjeta(idCarta):
	decidir_y_eliminar_carta(idCarta, valoresAceptar)

func rechazar_tarjeta(idCarta):
	decidir_y_eliminar_carta(idCarta, valoresRechazar)

func decidir_y_eliminar_carta(idCarta, valores):
	if idCarta == id:
		get_tree().call_group("seleccion", "aplicar_cambios", valores)
		queue_free()
