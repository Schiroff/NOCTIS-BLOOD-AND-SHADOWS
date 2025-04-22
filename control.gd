extends Control

@onready var time_counter: Label = $MarginContainer/timer_conteiner/time_counter as Label
@onready var score_counter: Label = $MarginContainer/score_conteiner/score_counter as Label
@onready var life_counter: Label = $MarginContainer/life_container/life_counter as Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text = str("%02d" % Globals.player_life)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text = str("%02d" % Globals.player_life)
