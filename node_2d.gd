extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("next_scene"):  # Verifica se a ação 'next_scene' foi pressionada
		_avancar()


func _avancar():
	get_tree().change_scene_to_file("res://tutorial.tscn")  # Troque para sua fase real
