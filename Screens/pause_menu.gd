extends Control

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible

func _ready():
	hide()

func _on_resumebutton_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_optionsbutton_pressed() -> void:
	pass # Replace with function body.

func _on_quitbutton_pressed() -> void:
	SceneManager.change_scene("level_transition_effect", "res://Screens/main_menu.tscn")
