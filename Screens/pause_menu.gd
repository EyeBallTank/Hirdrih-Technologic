extends Control

@onready var pausemenupart = $pausemenupart
@onready var optionsmenupart = $optionsmenupart

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible

func _ready():
	pausemenupart.visible = true
	optionsmenupart.visible = false
	hide()

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_resumebutton_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_optionsbutton_pressed() -> void:
	show_and_hide(optionsmenupart, pausemenupart)

func _on_quitbutton_pressed() -> void:
	SceneTransition.load_scene("res://Screens/main_menu.tscn")

func _on_quitbutton_2_pressed() -> void:
	show_and_hide(pausemenupart, optionsmenupart)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value)-30)

func _on_sound_slider_value_changed(value: float) -> void:
	#AudioServer.set_bus_volume_db(0,value)
	volume(1,value)

func _on_music_slider_value_changed(value: float) -> void:
	volume(2,value)

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
