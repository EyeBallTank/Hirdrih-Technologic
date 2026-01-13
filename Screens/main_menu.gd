extends Control

@onready var mainmenupart = $mainmenupart
@onready var optionsmenupart = $optionsmenupart

func _ready() -> void:
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
