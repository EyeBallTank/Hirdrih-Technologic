extends Node2D
class_name MovingPlatforms

@onready var path_follow_2d = $PathFollow2D
@export var time_of_path = 1.0
@export var looping = false
@onready var sprite = $AnimatableBody2D/AnimatedSprite2D
@export var spritename = "HIRDRIH VERTICAL"
#script exists for export var sprites
#REMINDER: PLATS CAN HAVE UNIQUE PATHS ON A LEVEL IF THEY'RE ADDED TO SCENE
#NOT WHEN YOU DUPLICATE THE SCENE, IT SEEMS

func _ready() -> void:
	move_tween()
	sprite.play(spritename)

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2d, "progress_ratio", 1.0, time_of_path)
	if looping:
		tween.tween_property(path_follow_2d, "progress_ratio", 0.0, time_of_path)
	else:
		tween.tween_property(path_follow_2d, "progress_ratio", 0.0, 0.0)
