extends Control

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
