extends Node

@onready var animation = $CanvasLayer/AnimationPlayer
var scene : String

func change_scene(anim, new_scene):
	scene = new_scene
	animation.play(anim)

func _new_scene():
	get_tree().change_scene(scene)

func pause_the_game():
	get_tree().paused = true

func unpause_the_game():
	get_tree().paused = false
	Signals.emit_signal("scene_has_changed")
