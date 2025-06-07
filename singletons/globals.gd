extends Node

var score := 0
var player_life := 3

var player = null
var current_chekpoint = null
var enemies_killed := 0

func respaw_player():
	if current_chekpoint != null:
		player.position = current_chekpoint.global_position
	

func reset_game():
	score = 0
	player_life = 3
	enemies_killed = 0
	current_chekpoint = null
