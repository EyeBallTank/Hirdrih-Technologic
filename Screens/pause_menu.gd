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
