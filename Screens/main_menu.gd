extends Control

@onready var mainmenupart = $mainmenupart
@onready var optionsmenupart = $optionsmenupart

func _ready() -> void:
	TranslationServer.set_locale("en")
	get_tree().paused = false
	mainmenupart.visible = true
	optionsmenupart.visible = false

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_start_button_pressed() -> void:
	SceneTransition.load_scene("res://src/levels/level_01.tscn")


func _on_options_button_pressed() -> void:
	show_and_hide(optionsmenupart, mainmenupart)


func _on_level_select_button_pressed() -> void:
	pass # SceneTransition.load_scene("NOT NOW")


func _on_gallery_button_pressed() -> void:
	pass # SceneTransition.load_scene("NOT NOW")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_quit_button_2_pressed() -> void:
	show_and_hide(mainmenupart, optionsmenupart)

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


func _on_pt_lang_button_pressed() -> void:
	TranslationServer.set_locale("pt")

func _on_en_lang_button_pressed() -> void:
	TranslationServer.set_locale("en")
