extends Area2D

@export var heal_amount: int = 1  # Quantas vidas a poção recupera
@onready var sprite = $Sprite2D

func _on_body_entered(body):
	print("foi blzblzblzbl")
	if body.name == "player":
		# Aumenta a vida do jogador (se ele tiver menos que o máximo, por exemplo)
		if Globals.player_life < Globals.max_life:
			Globals.player_life += heal_amount
			# Opcional: Limitar à vida máxima
			Globals.player_life = min(Globals.player_life, Globals.max_life)
			queue_free()  # Destroi a poção após o uso
