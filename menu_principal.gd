extends Control

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://intro.tscn")


func _on_começar_pressed() -> void:

	get_tree().change_scene_to_file("res://tutorial.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://MenuPrincipal.tscn")	
