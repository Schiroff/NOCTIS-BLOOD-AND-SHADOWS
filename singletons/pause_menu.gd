extends CanvasLayer

@onready var resume: Button = $menu_holder/RESUME

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_quit_pressed() -> void:
	# Primeiro, despausa o jogo
	get_tree().paused = false
	
	# Reseta os dados do jogo
	Globals.reset_game()
	
	# E volta para a primeira cena (exemplo: tutorial, fase 1, etc)
	get_tree().change_scene_to_file("res://tutorial.tscn")
