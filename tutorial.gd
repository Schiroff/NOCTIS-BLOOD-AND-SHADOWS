extends Node2D

@export var tile_texture: Texture
@export var columns: int = 5
@export var rows: int = 5
@export var tile_size: int = 64  # Ajuste conforme o tamanho do PNG
@onready var player := $player as CharacterBody2D
@onready var camera := $Camera2D as Camera2D

func _ready():
	for x in range(columns):
		for y in range(rows):
			var tile = Sprite2D.new()
			tile.texture = tile_texture
			tile.position = Vector2(x * tile_size, y * tile_size)
			add_child(tile)
			
			player.follow_camera(camera)
