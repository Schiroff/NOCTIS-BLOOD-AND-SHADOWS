extends Area2D

@onready var transtion: CanvasLayer = $"../transtion"
@export var next_level : String = ""

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and !next_level == "":
		transtion.change_scene(next_level)
	else:
		print("No Scen load")
