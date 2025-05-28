extends Node

var is_paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # normalmente a tecla Esc
		toggle_pause()

func toggle_pause():
	is_paused = not is_paused
	get_tree().paused = is_paused
	$PauseMenu.visible = is_paused


func _on_continuar_pressed() -> void:
	get_parent().toggle_pause()


func _on_sair_pressed() -> void:
	get_tree().quit()
