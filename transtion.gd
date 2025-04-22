extends CanvasLayer

@onready var color_rect: ColorRect = $Color_Rect

func _ready():
	show_new_scene()

func change_scene(path, delay = 2.5):
	var scene_transtion = get_tree().create_tween()
	scene_transtion.tween_property(color_rect, "threshold", 1.0, 0.5).set_delay(delay)
	await(get_tree().change_scene_to_file(path) == OK)

func show_new_scene():
	var show_transtion = get_tree().create_tween()
	show_transtion.tween_property(color_rect, "threshold", 0.0, 0.5 ).from(1.0)
