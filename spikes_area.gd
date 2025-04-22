extends Area2D

@onready var spikes: Sprite2D = $spikes

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && body.has_method("reset_player"):
		body.reset_player()
