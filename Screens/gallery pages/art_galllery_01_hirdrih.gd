extends Control

@onready var animationplayer = $AnimationPlayer

func _ready() -> void:
	get_tree().paused = false


func _process(delta: float) -> void:
	pass


func _on_quit_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/art_gallery_main.tscn")
