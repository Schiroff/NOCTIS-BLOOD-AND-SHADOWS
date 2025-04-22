extends Node

@onready var dialog_box_scene = preload("res://dialog_box.tscn")
var message_lines: Array[String] = []
var current_line = 0

var dialog_box
var dialog_box_position := Vector2.ZERO

var is_message_active := false
var can_advance_message := false

func start_message(position: Vector2, lines: Array[String]):
	if is_message_active:
		return
	
	message_lines = lines
	dialog_box_position = position
	show_text()
	is_message_active = true 
	
func show_text():
	dialog_box = dialog_box_scene.instantiate()
	dialog_box.text_display_finished.connect(_on_all_text_displayed)
	get_tree().root.add_child(dialog_box)
	dialog_box.global_position = dialog_box_position

	# Verifica se current_line é válido e a string tem o tamanho adequado
	if current_line < message_lines.size() and message_lines[current_line].length() > 0:
		dialog_box.display_text(message_lines[current_line])
	else:
		print("Erro: A string ou o índice não existe!")
		return  # Encerra a função se o índice for inválido

	can_advance_message = false

	
func _on_all_text_displayed():
	can_advance_message = true

func _unhandled_input(event):
	if event.is_action_pressed("advance_message") && is_message_active:
		dialog_box.queue_free()
		current_line += 1
		# Verifica se current_line não ultrapassou o tamanho das linhas
		if current_line >= message_lines.size():
			is_message_active = false
			current_line = 0  # ou pode colocar return aqui
			return
		show_text()
