extends Node2D

@onready var texture: Sprite2D = $texture
@onready var area_sign: Area2D = $area_sign

const  lines : Array[String] = [
	"Aqui começa a ascensão. As portas pesadas desta torre antiga rangem, como se hesitassem em permitir sua entrada. Dizem que poucos ousaram cruzá-las, e nenhum retornou para contar. O que espera acima está além do entendimento. E uma vez dentro, não há caminho de volta.",
	"O ar aqui já é diferente, carregado com um odor de morte e decadência. Os ecos de passos distantes parecem zombar de você, ou talvez sejam seus próprios? Eu passei por aqui, mas algo me seguiu... algo que ainda sinto atrás de mim. Continue, se tiver coragem, mas nunca abaixe sua guarda."
	
]

func _unhandled_input(event):
	if area_sign.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position, lines)
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
