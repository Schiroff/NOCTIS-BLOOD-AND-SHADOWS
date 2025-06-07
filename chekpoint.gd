extends Area2D


var is_active = false
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name != "player" or is_active:
		return
	active_checkpoint()

func active_checkpoint():
	Globals.current_chekpoint = self
	animated_sprite_2d.play("raising")
	is_active = true

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "raising":
		animated_sprite_2d.play("cheked")
