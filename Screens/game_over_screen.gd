extends Control


func _on_quit_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/main_menu.tscn")
