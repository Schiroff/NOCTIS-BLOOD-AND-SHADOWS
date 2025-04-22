extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 1200.0

var knockback_vector = Vector2.ZERO
var attacking = false

@onready var jump_sfx: AudioStreamPlayer2D = $jump_sfx as AudioStreamPlayer2D
@onready var hurt_sfx: AudioStreamPlayer2D = $hurt_sfx as AudioStreamPlayer2D
@onready var remote_transform := $remote as RemoteTransform2D

var initial_position := Vector2.ZERO

func _ready():
	initial_position = global_position

var is_hurt = false  # novo estado
# dentro de _physics_process:
func _physics_process(delta: float) -> void:

	if is_hurt:
		move_and_slide()
		return

	# ... (o resto do seu código continua igual)

	if not is_on_floor():
		velocity += Vector2(0, GRAVITY * delta)

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")

	# Animações:
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		
	elif direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
	
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies") and not is_hurt:
		if Globals.player_life <= 1:
			reset_player()
		else:
			Globals.player_life -= 1
			is_hurt = true
			$AnimatedSprite2D.play("hurt")
			hurt_sfx.play()

			if $ray_right.is_colliding():
				take_damage(Vector2(-200, -200))
			elif $ray_left.is_colliding():
				take_damage(Vector2(200, -200))

			# Espera a animação de dano terminar e libera o movimento
			await $AnimatedSprite2D.animation_finished
			is_hurt = false



func reset_player():
	Globals.player_life = 3
	global_position = initial_position
	velocity = Vector2.ZERO

func follow_camera(camera):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path

func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force  # Aplica o vetor de knockback
		var knockback_tween := get_tree().create_tween()
		knockback_tween.tween_property(self, "knockback_vector", Vector2.ZERO, duration)
