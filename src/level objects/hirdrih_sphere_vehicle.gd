extends Path2D

@onready var path_follow_2d = $PathFollow2D
@export var time_of_path = 1.0
@export var looping = false


func _ready() -> void:
	Signals.blue_button_was_pressed.connect(_Blue_Sphere_Vehicle_Activated)
	
func _Blue_Sphere_Vehicle_Activated():
	move_tween()

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2d, "progress_ratio", 1.0, time_of_path)
	if looping:
		tween.tween_property(path_follow_2d, "progress_ratio", 0.0, time_of_path)
	else:
		tween.tween_property(path_follow_2d, "progress_ratio", 0.0, 0.0)
