extends Node2D

@onready var botao = $Avancar

func _ready():
	botao.pressed.connect(_avancar)

func _avancar():
	get_tree().change_scene_to_file("res://tutorial.tscn") # troque para sua fase real
