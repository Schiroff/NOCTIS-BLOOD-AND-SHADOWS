extends Node2D

@export var tile_texture: Texture
@export var columns: int = 5
@export var rows: int = 5
@export var tile_size: int = 64  # Ajuste conforme o tamanho do PNG
@onready var player := $player as CharacterBody2D
@onready var camera := $Camera2D as Camera2D

@onready var player_scene = preload("res://actors/character_body_2d.tscn")

func _ready():
	for x in range(columns):
		for y in range(rows):
			Globals.player = player
			var tile = Sprite2D.new()
			tile.texture = tile_texture
			tile.position = Vector2(x * tile_size, y * tile_size)
			add_child(tile)
			
			Globals.player.follow_camera(camera)

func reload_game():
	await get_tree().create_timer(1.0).timeout
	var player = player_scene.instantiate()
	add_child(player)
	Globals.player = player
	Globals.player.follow_camera(camera)
	Globals.respaw_player()
#	get_tree().reload_current_scene()
